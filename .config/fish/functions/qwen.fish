function qwen
    set -l moe 30
    set -l ctx 32768
    test -n "$argv[1]"; and set moe $argv[1]
    test -n "$argv[2]"; and set ctx $argv[2]
    llama-server -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-IQ4_XS --load-mode none -ngl 99 --no-reasoning-preserve --n-cpu-moe $moe -c $ctx --port 8082 $argv[3..-1]
end
