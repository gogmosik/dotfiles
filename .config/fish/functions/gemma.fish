function gemma
    set -l ctx 32768
    test -n "$argv[1]"; and set ctx $argv[1]
    llama-server -hf llmfan46/gemma-4-26B-A4B-it-ultra-uncensored-heretic-GGUF:Q4_K_S --fit on -c $ctx --no-reasoning-preserve --port 8080 $argv[2..-1]
end
