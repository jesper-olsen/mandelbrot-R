# Mandelbrot in R

This repository contains an R implementation for generating visualizations of the Mandelbrot set. It is part of a larger project comparing implementations across various programming languages.

The program compiles to a single native executable. It can render the Mandelbrot set directly to the terminal as ASCII art or produce a data file for `gnuplot` to generate a high-resolution PNG image.

### Other Language Implementations

This project compares the performance and features of Mandelbrot set generation in different languages.
Single Thread/Multi-thread shows the number of seconds it takes to do a 5000x5000 calculation.


| Language    | Repository                                                           | Single Thread   | Multi-Thread | Simd | Multi-Thread + Simd |
| :--------   | :------------------------------------------------------------------- | ---------------:| -----------: | ----:| ------------------: |
| Awk         | [mandelbrot-awk](https://github.com/jesper-olsen/mandelbrot-awk)     |           417.9 |              |      |                     |
| C           | [mandelbrot-c](https://github.com/jesper-olsen/mandelbrot-c)         |             3.6 |          0.6 |  0.7 |               0.2   |
| Erlang      | [mandelbrot_erl](https://github.com/jesper-olsen/mandelbrot_erl)     |            35.6 |          8.3 |      |                     |
| Fortran     | [mandelbrot-f](https://github.com/jesper-olsen/mandelbrot-f)         |             4.5 |              |      |                     |
| Lua         | [mandelbrot-lua](https://github.com/jesper-olsen/mandelbrot-lua)     |            33.2 |              |      |                     |
| Mojo        | [mandelbrot-mojo](https://github.com/jesper-olsen/mandelbrot-mojo)   |             3.8 |          1.2 |  0.7 |               0.4   |
| Nushell     | [mandelbrot-nu](https://github.com/jesper-olsen/mandelbrot-nu)       |  (est)  17186.6 |              |      |                     |
| Odin        | [mandelbrot-odin](https://github.com/jesper-olsen/mandelbrot-odin)   |             4.4 |              |      |                     |
| Python      | [mandelbrot-py](https://github.com/jesper-olsen/mandelbrot-py)       |     (pure) 93.3 | (jax)    5.9 |      |                     |
| **R**       | [mandelbrot-R](https://github.com/jesper-olsen/mandelbrot-R)         |           335.0 |              |      |                     |
| Rust        | [mandelbrot-rs](https://github.com/jesper-olsen/mandelbrot-rs)       |             4.7 |          1.3 |      |                     |
| Swift       | [mandelbrot-swift](https://github.com/jesper-olsen/mandelbrot-swift) |             4.5 |          1.2 |  1.3 |               0.7   |
| Tcl         | [mandelbrot-tcl](https://github.com/jesper-olsen/mandelbrot-tcl)     |           306.9 |              |      |                     |
| Zig         | [mandelbrot-zig](https://github.com/jesper-olsen/mandelbrot-zig)     |             4.9 |          0.9 |  0.7 |               0.3   |


## Prerequisites

You will need the following installed:

1.  Rscript
2.  **Gnuplot** (required *only* for generating PNG images).



## Usage

The compiled executable can be configured via command-line arguments using a `key=value` format.

### 1. ASCII Art Output

To render the Mandelbrot set directly in your terminal, run the script


```sh
Rscript mandelbrot.R width=100 height=75 png=0

                                                                                .


                                                                              ..

                                                                               .
                                                                               . .
                       .                                                        .
                                                                               .
                                                                              .  .      .
                                                                                     . .....
                                                                                 .        .
                                                                                   .      .. . .
                                                                                              ..
 .
  .                                                                                            .
                         _
                                                                                             . .
  _                      .                                                                     _M.
                          .                                                                    .M.
       .               .. .                                                                   ._. ..
   .. ..             . ..                                                                 .  .    ..
     .MM.             .                  . .                                                      ._
     ..M.. .                          .                                                   .        .
      ..   .  .     ...                 .
    ...     . .     ..                 .
    .   .    ...    .
    .        ..... .                    ..
             .   ...   .    .                                                                    .._
                   ..                   .                                                  .    _a..
                   ....     .            .                                              ._  a    .._
                   .....  ...         ....                                                ..a.   .._
                   .... .  .. .       ..._     .                .               ..    ..  a__......_
                   .._...  _...        .                                         .  ._..._._....aa.W
                    ..._......        .. .   .                ..                  .    ....__._.M_WM
                    ..2M.__a.   .      _....                                      .    .  .._a_MMMMM
               ..  ...MM2___..  .     ..._ ...                                         .  M.2MMMMMMM
                ......MMMMM._a  ... .  ._.                    .        .                  ._MMMMMMMM
                ._aa_aMMMMMM..a.._. ...__.                     . . .                     .__aMMMMMMM
             ..a_...2MMMMMMM..a._a..._..W._     .                 ...  ..  .             .2._MMMMMMM
            .  a   ..MMMMMMM...M_M_W_.M_M..    .                  .a_.._  _          _  ..M_MMMMMMMM
                   ._MMMMMMaMMMMMMaM.MMM_.2    .                   ._..M.             __..a_MMMMMMMM
                 ...__MMMMMMMMMMMMMMMaMMMM.  ...                    .._a_.__   .          _.MMMMMMMM
                   ...._MMMMMMMMMMMMMMMMM.a ...                   .._____.22   .          ._MMMMMMMM
    .        .   _..._WMMMMMMMMMMMMMMMMMa.......               _ _.a.._a...     ..       ..._MMMMMMM
       ..      .._..MMMMMMMMMMMMMMMMMMMMMMa....2.       .         ....aM_._.    .a_..     ..aMMMMMMM
        . _    ...__aMMMMMMMMMMMMMMMMMMMMM__.__         .           .aMMMaMM. M.M2Ma. W.  ._.aMMMMMM
         _.     ..MMMMMMMMMMMMMMMMMMMMMMMMMMM_                    .._2aMMMWW.  .__W_..aM......_MMMMM
          ..   ..._2MMMMMMMMMMMMMMMMMMMMMMMMa..          .  .    .Wa_WMMMMM2.a..MMMM.._M.2M.a.._MMMM
         ...  _..W2MMMMMMMMMMMMMMMMMMMMMMMMM_.W.         ._._ .   .M_MMMMMMM.MM.MMMM.MMMaaMaM2MMMMMM
      . ._.....W..2MMMMMMMMMMMMMMMMMMMMMMMMMM...         .._aW2_  ..2MMMMMMM..MWMMMMMMMMMMMMMMMMMMMM
    . .a. ._..a_MaMMMMMMMMMMMMMMMMMMMMMMMMMMMW.          ._MW_.......2MMMMM_aMMMMMMMMMMMMMMMMMMMMMMM
    . ..   ..aaMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM_...   .    .a.MMM..2M.a.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
    ...     ._aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM_M.     2. ...2MMM_.MM_2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 .   .     ..._aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM..     .2_M.._MMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           . ...._MMMMMMMMMMMMMMMMMMMMMMMMMMM_W.     __MM.2.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      .   .   ...aMMMMMMMMMMMMMMMMMMMMMMMMMMMM_. ..aM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
               ..MMMMMMMMMMMMMMMMMMMMMMMMMMMM2..a..M_M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            . ....MMMMMMMMMMMMMMMMMMMMMMMMMMM....M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           ..._.._aMMMMMMMMMMMMMMMMMMMMMMMMM_..MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
             __._WMMMMMMMMMMMMMMMMMMMMMMMMMWM.MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            ..._2MMaMMMMMMMMMMMMMMMMMMMMMMM_._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
           _._ ._.._MMMMMMMMMMMMMMMMMMMMMMM_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
            ._   ..._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        .. .     2_.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        ...     . .Ma_WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                 a_..2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                 .  ...._M2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
               _.    .2._._a_MM___MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                    .  ....M...MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                        ...._.aMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                        ..2._MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                       M_MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
                   _2...M_2MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
```

### 2. PNG Image Generation

To create a high-resolution PNG, you first generate a data file and then process it with `gnuplot`.

**Step 1: Generate the data file**
Set `png=1` and specify the desired dimensions. Redirect the output to a file.

```sh
Rscript mandelbrot.R width=1000 height=750 png=1 >image.dat
```

**Step 3: Run gnuplot**
This will read `image.dat` and create `mandelbrot.png`.

```sh
gnuplot topng.gp
```
The result is a high-quality `mandelbrot.png` image.

![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-R/main/mandelbrot.png)


```
Rscript mandelbrot.R width=1000 height=750 png=1 >image.txt

gnuplot topng.gp
^open mandelbrot.png
```
![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-R/main/mandelbrot.png)


`## Performance

Benchmarks were run on a **Macbook Air M5** with `Rscript (R) version 4.6.1 (2026-06-24)`

**Generating a 1000x750 data file:**
```sh
time Rscript mandelbrot.R width=1000 height=750 png=1 >image.txt
8.12s user 0.06s system 98% cpu 8.275 total
```

**Generating a 5000x5000 data file:**
```sh
time Rscript mandelbrot.R width=5000 height=5000 png=1 >image.txt
332.40s user 1.49s system 99% cpu 5:35.04 total
```
