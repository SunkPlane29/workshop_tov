# Solving the Tolman-Oppenheimer-Volkoff (TOV) equations

Nesse repositório faremos uma breve discussão de como resolver as equações de Tolman-Oppenheimer-Volkoff, com uma certa motivação em como podemos fazer essas soluções de forma mais otimizada.assim como 

Inicialmente precisaremos dos seguintes pacotes de Julia instalados:

- Interpolations
- CSV
- DataFrames
- Plots

Podemos instalar eles usando o terminal:

```
$ julia
julia> ]
(@v1.9) pkg> add Interpolations, CSV, DataFrames, Plots
```

O restante do código será rodado a partir do notebook `main.ipynb`.

