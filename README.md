# ModularPackage

The aim is to illustrate how to build a package made up of a number of modules so that each module may be loaded independently.

[Reexport](https://github.com/simonster/Reexport.jl) is used to straightforwardly deal with submodules exports; and modules are hierarchically linked, meaning that any supermodule automatically exports all of its submodules.

These behaviours are illustrated in `test/runtests.jl`.
