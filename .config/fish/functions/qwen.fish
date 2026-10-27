function qwen
    set -l ctx 32768
    test -n "$argv[1]"; and set ctx $argv[1]
    llama-server -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-IQ4_XS --fit on -c $ctx --no-reasoning-preserve --port 8080 $argv[3..-1]
end
