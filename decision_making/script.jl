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
	1 1 1 1;
	1 1 1 1;
	1 1 1 1;
	1 1 1 1
]

A2 = [
	1 5 1/5 1/5;
	1/5 1 1/5 1/5;
	5 5 1 1/5;
	5 5 5 1
]

A3 = [
	1 1 1/3 1/7;
	1 1 1 1/7;
	3 1 1 1/7;
	7 7 7 1
]

A = map((a1, a2, a3) -> ceil(geomean([a1, a2, a3]) * 100) / 100, A1, A2, A3)

println(A)

val, vec = eigvalvecapprox(A)

Is = ids(val, size(A)[1])
Rs = ceil(rs(Is, size(A)[1]) * 1e3) / 1e3

println("vec ", [ceil(x * 1e4) / 1e4 for x in vec])
println("val ", ceil(val * 1e2) / 1e2)
println("Rs ", Rs)

W1 = [
	0.4097 0.3724 0.0783 0.1438;
	0.2631 0.3995 0.0533 0.1196;
	0.2589 0.1702 0.2102 0.2265;
	0.0685 0.0581 0.6583 0.5102
]

W2 = [
	0.0640 0.2528 0.1085;
	0.0898 0.3587 0.1763;
	0.5228 0.0532 0.0833;
	0.3236 0.3355 0.6321
]

W3 = [
	0.2103;
	0.3813;
	0.4086
]

W0 = W1 * W2 * W3

println("W0 ", W0)

