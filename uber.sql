-- run duckdb test.db in terminal and send these lines over

-- some examples
SELECT "Service:Date", "Stop:station name"
FROM 'https://blobs.duckdb.org/data/services-2023.parquet'
LIMIT 3;

SELECT *
FROM 'https://huggingface.co/datasets/blog_authorship_corpus/resolve/refs%2Fconvert%2Fparquet/blog_authorship_corpus/train/0000.parquet'
LIMIT 1;
--- examples end

 -- make sure we can connect to hugging face, should quickly return one item
SELECT *
FROM 'https://huggingface.co/datasets/HuggingFaceFW/fineweb/resolve/main/data/CC-MAIN-2024-18/000_00000.parquet'
WHERE language == 'en'
AND url ^@ 'https://'
LIMIT 1;

-- try to get some cnbc pages. takes a while (~10-20 mins)
SELECT *
FROM read_parquet([
    'https://huggingface.co/datasets/HuggingFaceFW/fineweb/resolve/main/data/CC-MAIN-2024-18/000_00000.parquet',
    'https://huggingface.co/datasets/HuggingFaceFW/fineweb/resolve/main/data/CC-MAIN-2024-18/000_00001.parquet',
    'https://huggingface.co/datasets/HuggingFaceFW/fineweb/resolve/main/data/CC-MAIN-2024-18/000_00002.parquet',
    'https://huggingface.co/datasets/HuggingFaceFW/fineweb/resolve/main/data/CC-MAIN-2024-18/000_00003.parquet',
    'https://huggingface.co/datasets/HuggingFaceFW/fineweb/resolve/main/data/CC-MAIN-2024-18/000_00004.parquet',
])
WHERE language == 'en'
AND url ^@ 'https://www.cnbc.com'
; -- LIMIT 1;
