function gemma
    set -l ctx 32768
    if test (count $argv) -ge 1; and string match -qr '^[0-9]+$' -- $argv[1]
        set ctx $argv[1]
        set -e argv[1]
    end
    llama-server -hf llmfan46/gemma-4-26B-A4B-it-ultra-uncensored-heretic-GGUF:Q4_K_S -dev ROCm0 --fit on -c $ctx --no-reasoning-preserve --port 8080 $argv
end
