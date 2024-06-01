#!/usr/bin/env fish
echo \[
for u in https://huggingface.co/datasets/HuggingFaceFW/fineweb/resolve/main/data/CC-MAIN-2024-18/00$(seq -w 0 4)_000$(seq -w 0 49).parquet
    echo \'$u\',
end
echo \]
