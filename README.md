# Mandelbrot in R

This repository contains an R implementation for generating visualizations of the Mandelbrot set. It is part of a larger project comparing implementations across various programming languages.

The program compiles to a single native executable. It can render the Mandelbrot set directly to the terminal as ASCII art or produce a data file for `gnuplot` to generate a high-resolution PNG image.

### Other Language Implementations

This project compares the performance and features of Mandelbrot set generation in different languages.

| Language    | Repository                                                         | Single Thread   | Multi-Thread |
| :--------   | :----------------------------------------------------------------- | ---------------:| -----------: |
| Awk         | [mandelbrot-awk](https://github.com/jesper-olsen/mandelbrot-awk)     |           805.9 |              |
| C           | [mandelbrot-c](https://github.com/jesper-olsen/mandelbrot-c)       |             9.1 |              |
| Erlang      | [mandelbrot_erl](https://github.com/jesper-olsen/mandelbrot_erl)   |            56.0 |           16 |
| Fortran     | [mandelbrot-f](https://github.com/jesper-olsen/mandelbrot-f)       |            11.6 |              |
| Lua         | [mandelbrot-lua](https://github.com/jesper-olsen/mandelbrot-lua)   |           158.2 |              |
| Mojo        | [mandelbrot-mojo](https://github.com/jesper-olsen/mandelbrot-mojo) |                 |              |
| Nushell     | [mandelbrot-nu](https://github.com/jesper-olsen/mandelbrot-nu)     |   (est) 11488.5 |              |
| Python      | [mandelbrot-py](https://github.com/jesper-olsen/mandelbrot-py)     |    (pure) 177.2 | (jax)    7.5 |
| **R**       | [mandelbrot-R](https://github.com/jesper-olsen/mandelbrot-R)       |           545.8 |              |
| Rust        | [mandelbrot-rs](https://github.com/jesper-olsen/mandelbrot-rs)     |             8.9 |          2.5 |
| Tcl         | [mandelbrot-tcl](https://github.com/jesper-olsen/mandelbrot-tcl)   |           706.1 |              |


## Prerequisites

You will need the following installed:

1.  Rscript
2.  **Gnuplot** (required *only* for generating PNG images).


## Usage

The compiled executable can be configured via command-line arguments using a `key=value` format.

### 1. ASCII Art Output

To render the Mandelbrot set directly in your terminal, run the script


```sh
% Rscript mandelbrot.R width=100 height=75 png=0

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
% time Rscript mandelbrot.R width=1000 height=750 png=1 >image.dat
```

**Step 3: Run gnuplot**
This will read `image.dat` and create `mandelbrot.png`.

```sh
gnuplot topng.gp
```
The result is a high-quality `mandelbrot.png` image.

![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-R/main/mandelbrot.png)


```
% Rscript mandelbrot.R width=1000 height=750 png=1 >image.txt

% gnuplot topng.gp
% ^open mandelbrot.png
```
![PNG](https://raw.githubusercontent.com/jesper-olsen/mandelbrot-R/main/mandelbrot.png)


`## Performance

Benchmarks were run on an **Apple M1** system with Rscript (R) version 4.5.0 (2025-04-11)

**Generating a 1000x750 data file:**
```sh
% time Rscript mandelbrot.R width=1000 height=750 png=1 >image.txt
13.01s user 0.14s system 99% cpu 13.217 total
```

**Generating a 5000x5000 data file:**
```sh
time Rscript mandelbrot.R width=5000 height=5000 png=1 >image5k.txt
545.76s user 39.57s system 93% cpu 10:28.74 total
```
``
