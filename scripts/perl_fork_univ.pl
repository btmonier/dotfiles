#!/usr/local/bin/perl
use strict;
use warnings;
unless (@ARGV==2) 
{
	print "Usage: perl_fork_univ.pl JobListFile ProcessNumber\n";
	exit;
}
my ($jobfile, $maxtask) = @ARGV;

unless (-e $jobfile) 
{
	print "Usage: perl_fork_univ.pl JobListFile ProcessNumber\n";
	print "File $jobfile does not exist! Exit now!\n";
	exit;
}

unless ($maxtask=~/^\d+$/) 
{
	print "Usage: perl_fork_univ.pl JobListFile ProcessNumber\n";
	print "ProcessNumber is not right\n";
	exit;
}

use POSIX ":sys_wait_h";
### read in a job list
open (IN, "$jobfile") || die "Cannot open the job file $jobfile\n";
my @joblist = ();
while (<IN>)
{
        chomp;
		if (/\w/) 
		{
			push @joblist, $_;
		}
}
close IN;

my $ntasks = @joblist + 0;

#initial fork child processes
my @procs;
my @times;
my $task = 0;
my $totaltime = 0;
my $taskdone = 0;
my $starttime;

print "STARTING: maxtask=$maxtask ntasks=$ntasks\n";
$starttime = time();
for(my $i=0; $i<$maxtask; $i++)
{
  #we may have less tasks tne $maxtask
  if($i > $#joblist){last;}
  $task++;
  print "starting child $i task $task ";
  $times[$i] = time();
  $procs[$i] = start_task($i, $task, \@joblist, \@procs);
  print " pid $procs[$i]\n";
}

#waiting for child processes to finish and execute remaining tasks in their place
while(1)
{
  sleep(2); #there is no need to check every milisecond - it would use too much CPU
  my $n=0;
  for(my $i=0; $i<=$#procs; $i++)
  {
    if($procs[$i] != 0)
    {
      my $kid = waitpid($procs[$i], WNOHANG);
      if($kid <= 0)
      {
        #process exists
        $n++;
      }
      else
      {
        my $child_time = time() - $times[$i];
        $totaltime += $child_time;
        $taskdone++;
        my $ave = sprintf("%.2f", $totaltime/$taskdone);
        print "Child " . ($i+1) . " finished (pid=" . $procs[$i] . ") exe time: $child_time sec (" . convtme($child_time)  . "), average exe time: $ave sec (" . convtme($ave) . ")\n";
        $procs[$i] = 0 ;
        if($task < $ntasks)
        {
          $task++;
          $times[$i] = time();
          $procs[$i] = start_task($i, $task, \@joblist, \@procs);
          print " child " . ($i+1) . " restarted for task $task with pid $procs[$i]\n";
          $n++;
        }
      }
    }  
  }
  if($n==0){last;}
}

my $totaltime1 = time() - $starttime;

print "ALL DONE\n";
print "Total execution time for all tasks combined is $totaltime sec = " . convtme($totaltime)  . "\n";
print "Execution time for server (wallclock time) is $totaltime1 sec = " . convtme($totaltime1)  . "\n";
my $ave = sprintf("%.2f", $totaltime/$taskdone);
print "Average task execution time is $ave sec = " . convtme($ave) . "\n";

sub start_task
{
  my ($i, $task, $joblist_ref, $procs_ref) = @_;
  my @procs = @{$procs_ref};

  my $pid = fork();
  if($pid < 0)
  {
  #error
    print "\n\nERROR: Cannot fork child $i\n";
    for(my $j=0; $j<=$#procs; $j++)
    {
      system("kill -9 " . $procs[$j]);
    }
    exit;
  }
  if($pid == 0)
  {
  #child code
    child_exec($i+1, $task, $joblist_ref);
    exit;
  }
  #master - continue, $pid contains child pid
  return $pid;
}

sub child_exec
{
  my ($num, $tasknum, $jobarray) = @_;
  system($$jobarray[$tasknum-1]);
}

sub convtme
{
  my ($tsec) = @_;

  my $msec = int(100*($tsec - int($tsec)));
  my $min = int($tsec/60);
  my $sec = int($tsec) - $min*60;
  my $hrs = int($min/60);
  $min = $min - $hrs*60;
  my $days = int($hrs/24); 
  $hrs = $hrs - $days*24;

  my $timestr = sprintf("%02d:%02d:%02d.%02d", $hrs, $min, $sec, $msec);
  if($days>0){$timestr .= $days . "d " . $timestr;} 
  return $timestr;
}
