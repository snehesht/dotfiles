function say() {
    gtts-cli "$*" -l 'en' -o /tmp/saya.mp3 && ffplay -nodisp -autoexit -af 'volume=0.3' /tmp/saya.mp3
}
