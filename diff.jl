"""
next_point calcula o próximo ponto da solução de um problema de valor inicial
utilizando o método de Runge-Kutta de 4ª ordem.

# Argumentos
- `f`: função que descreve o problema de valor inicial
- `t`: tempo atual
- `x`: valor atual da solução
- `h`: passo de integração

# Retorno
Próximo ponto da solução do problema de valor inicial.
"""
function next_point(f, t, x, h)
    kn1 = f(t, x)
    kn2 = f(t + h/2, x .+ h/2 .* kn1)
    kn3 = f(t + h/2, x .+ h/2 .* kn2)
    kn4 = f(t + h, x .+ h .* kn3)

    return x .+ h/6 .* (kn1 .+ 2 .* kn2 .+ 2 .* kn3 .+ kn4)
end

"""
solve_system resolve um sistema de equações diferenciais ordinárias de primeira ordem
utilizando o método de Runge-Kutta de 4ª ordem.

# Argumentos
- `f`: função que recebe um vetor de valores e retorna um vetor de derivadas
- `t0`: valor inicial de t
- `x0`: vetor de valores iniciais de x
- `h`: passo
- `condition`: função que recebe t e x e retorna um booleano indicando se o método deve continuar

# Retorno
Uma matriz onde cada linha é um ponto da solução. A primeira coluna é o valor de t e as demais
colunas são os valores de x.
"""
function solve_system(f, t0, x0, h, condition)
    tn = t0
    xn = x0
    sol = [[t0, x0...]] 
    i = 1

    while condition(tn, xn, i)
        xn = next_point(f, tn, xn, h)
        tn += h
        push!(sol, [tn, xn...])
        i += 1
    end

    # O motivo de usarmos permutedims é que queremos transformar um vetor de vetores em uma matriz
    return permutedims(hcat(sol...))
end