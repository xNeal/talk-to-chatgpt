# talk-to-chatgpt

Currently just for **Mac**.

## Quick start

- make sure you have the `sdl2` package, in Mac use `brew install sdl2`
- Download Audio-Text model: `./models/download-ggml-model.sh base.en`

  - Models you can choose: "tiny.en" "tiny" "base.en" "base" "small.en" "small" "medium.en" "medium" "large-v1" "large".

- Add your [personal API key](https://platform.openai.com/account/api-keys) in `config.json`

```json
{
    "Authorization": "Add your key"
}
```

- Build encode tester `make test`

- Get your encode time in “whisper_print_timings” part : `./test -m ./models/ggml-base.en.bin`

- Build example  `make stream`

- Run example `./stream -m ./models/ggml-base.en.bin -t 8 --step 1300 --length 5000`

    If your encode time is 750 ms, then you should use 2 times in parameter `--step`, which is 1300

## Game Rule
1. After the screen shows `[Start speaking]`, you can ask your questions.
2. The program will continuously detect your questions and show them on the screen.
3. When the program detects correctly, you can say "good". Then the question will be sent to GPT-3.

Please enjoy the program, and share with us your experience :)
