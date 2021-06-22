This is a note for bumping newsboat ebuild

1. Get the new newsboat source
2. Unpack it:

        # tar xf newsboat-2.23.tar.xz --directory=23

3. Build the ebuilds using `cargo-ebuild`:

        ```
        # cd 23/newsboat-2.23/rust
        # for i in $(ls); do echo $i; cd $i; cargo-ebuild ebuild --manifest-path Cargo.toml; cd ..; done
        ```

4. Generate the list of crates and make it unique:

        ```
        (newsboat-2.23/rust) # for i in $(ls); do source "$i/"*.ebuild; echo $CRATES >> /tmp/crates; done
        # sort -u <(cat /tmp/crates) | xclip -selection clipboard
        ```
5. Paste the CRATES content into bumped ebuild
6. Watch the output of `USE="verify=sig" ebuild newsboat-2.23.ebuild manifest prepare install test`
