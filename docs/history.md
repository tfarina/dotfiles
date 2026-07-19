# A Short History of Dotfiles

The term **dotfiles** refers to configuration files on Unix-like systems
that begin with a dot (`.`), such as `.bashrc`, `.vimrc`, or `.profile`.

These files are traditionally hidden by default — and here's the origin
story behind that convention:

> The legend goes that dot-files arose from a bug in the earliest days
> of UNIX: in an effort to avoid listing the `.` and `..` entries of a
> directory, the `ls` command skipped files that began with the `.`
> character. As a result, any file with a name beginning with `.` was
> not reported by `ls`, i.e., it was a "hidden" file.
>
> A user's home directory was a convenient place to put user-specific
> configuration files, but such files were also an eyesore; one popular
> solution to this problem was to make those configuration files hidden
> so that they wouldn't annoy the user.
>
> Thus, the tradition of dot-files was born.
> Source: [Quora](https://www.quora.com/What-are-dotfiles/answer/Costya-Perepelitsa)

---

For more technical and historical insights, see:
- [The Unix Heritage Society](https://www.tuhs.org/)
- [Hidden files in Unix](https://en.wikipedia.org/wiki/Hidden_file_and_hidden_directory#Unix_and_Unix-like_environments)
