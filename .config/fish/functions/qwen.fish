function qwen
    set -l ctx 32768
    if test (count $argv) -ge 1; and string match -qr '^[0-9]+$' -- $argv[1]
        set ctx $argv[1]
        set -e argv[1]
    end
    llama-server -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-IQ4_XS --fit on -c $ctx --no-reasoning-preserve --port 8080 $argv
end
