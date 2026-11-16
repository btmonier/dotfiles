# Personal environment exports (add PATH, JAVA_HOME, etc. here)
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="nvim"
export VISUAL="$EDITOR"

# Cornell AI Gateway for Claude Code.
# The API key stays in zsh/secrets/anthropic.env (gitignored). See anthropic.env.example.
export ANTHROPIC_BASE_URL=https://api.ai.it.cornell.edu/
export ANTHROPIC_MODEL=claude-opus-5-5
export ANTHROPIC_SMALL_FAST_MODEL=claude-haiku-4-5
export ANTHROPIC_DEFAULT_OPUS_MODEL=claude-opus-5-5
export ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-haiku-4-5
export ANTHROPIC_DEFAULT_SONNET_MODEL=claude-sonnet-4-6
export CLAUDE_CODE_DISABLE_EXPERIMENTAL_BETAS=1
export DISABLE_TELEMETRY=1
