using Stats

A1 = [
	1 1 1/5;
	1 1 1/5;
	5 5 1
]

A2 = [
	1 1/3 5;
	3 1 5;
	1/5 1/5 1
]

A3 = [
	1 1/3 5;
	3 1 5;
	1/5 1/5 1
]

A = map((a1, a2, a3) -> ceil(geomean([a1, a2, a3]) * 100) / 100, A1, A2, A3)

println(A)
println("eigvec", eigmax(A))

