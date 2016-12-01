using Stats

function eigvalvecapprox(A)
    eps = 1e-9
    e = ones(size(A)[1])
    num = A * e
    denom = e' * num
    prev = num / denom
    num = A * num
    denom = e' * num
    next = num / denom
    while true
        prev = next
        num = A * num
        denom = e' * num
        next = num / denom
        result = abs(next - prev) .> eps
        done = true
        for r in result
            if !r
                done = false
                break
            end
        end
        if done
            break
        end
    end
    Wa = next
    lmax = (e' * A * Wa) / (e' * Wa)
    return lmax[1], Wa
end

function ids(lmax, n)
    return (lmax - n) / (n - 1)
end

function rs(idx, n)
    mean = 0
    if n == 3
        mean = 0.58
    elseif n == 4
        mean = 0.9
    elseif n == 5
        mean = 1.12
    end
    return idx / mean
end

A1 = [
	1 1 1/5 1/5;
	1 1 1/5 1/3;
	5 5 1 1/5;
	5 3 5 1
]

A2 = [
	1 1/5 1/7 1/3;
	5 1 1/5 1/3;
	7 5 1 7;
	3 3 1/7 1
]

A3 = [
	1 1 1/9 1/9;
	1 1 1/9 1/9;
	9 9 1 5;
	9 9 1/5 1
]

A = map((a1, a2, a3) -> ceil(geomean([a1, a2, a3]) * 100) / 100, A1, A2, A3)

println(A)

val, vec = eigvalvecapprox(A)

val = ceil(val * 1e2) / 1e2
vec = [ceil(x * 1e4) / 1e4 for x in vec]

println("vec ", vec)
println("val ", val)

Is = ids(val, size(A)[1])
Rs = ceil(rs(Is, size(A)[1]) * 1e3) / 1e3

println("Rs ", Rs)

