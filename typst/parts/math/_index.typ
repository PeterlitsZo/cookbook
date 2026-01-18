#let vectorLen(x) = [
  #sym.bar.v.double #h(0.07em) #x #h(0.07em) #sym.bar.v.double
]

= 数学

== 线性代数

=== 向量

我们一般使用 $arrow(a)$ 来表格向量。或者使用开始点到结束点来表示一个向量，比如
$arrow(A B)$。向量有方向和长度，没有固定的起始点。即两个向量，只要它方向和长度相
同，我们就认为它们是相等的。

我们使用 $vectorLen(arrow(a))$ 来表示向量的长度。

我们可以称长度为 1 的向量为单位向量。对于向量 $arrow(a)$，那么我们可以得到它对应
的单位向量 $hat(a) = frac(arrow(a), vectorLen(arrow(a)), style: "horizontal")$。
我们可以使用单位向量来表示其方向。  

我们可以让向量相加，表示为 $arrow(a) + arrow(b)$。

在笛卡尔坐标系中，向量 $arrow(a)$ 可以表示为 $x$ 轴的单位向量 $arrow(i)$ 和 $y$
轴的单位向量 $arrow(j)$ 的线性组合，即 $arrow(a) = x arrow(i) + y arrow(j)$。此
时我们可以将 $arrow(a)$ 表示为 $ arrow(a) = vec(x, y) $ 同时有 $ arrow(a)^T =
(x, y) wide vectorLen(arrow(a)) = sqrt(x^2 + y^2) $

向量支持点乘和叉乘。其中点乘为 $ arrow(a) dot.c arrow(b) = vectorLen(arrow(a))
vectorLen(arrow(b)) cos theta \ cos theta = frac(arrow(a) dot.c arrow(b),
vectorLen(arrow(a)) vectorLen(arrow(b))) $ 对于单位向量，有 $cos theta = hat(a)
dot.c hat(b)$。点乘支持性质

$
  arrow(a) dot.c arrow(b) = arrow(b) dot.c arrow(a) \
  arrow(a) dot.c (arrow(b) + arrow(c)) = arrow(a) dot.c arrow(b) + arrow(a)
    dot.c arrow(c) \
  (k arrow(a)) dot.c arrow(b) = k (arrow(a) dot.c arrow(b))
$

在 2 维平面上，有 $ arrow(a) dot.c arrow(b) = vec(x_a, y_a) dot.c vec(x_b, y_b)
= x_a x_b + y_a y_b $ 在 3 维空间中，有 $ arrow(a) dot.c arrow(b) = vec(x_a,
y_a, z_a) dot.c vec(x_b, y_b, z_b) = x_a x_b + y_a y_b + z_a z_b $

在图形学中，我们可以使用点乘来找到两个向量之间的夹角。或者我们可以使用点乘来找到
一个向量在另一个向量方向上的投影。即有 $arrow(b)_perp = vectorLen(arrow(b)) cos
theta dot.c hat(a)$。当有了投影，我们就能将一个向量分解为两个互相垂直的向量。

向量的点乘还能告诉我们两个向量在方向上有多接近。同时还能告诉我们两个向量的方向是
否相同。

而叉乘为 $ arrow(a) times arrow(b) = vectorLen(arrow(a)) thin
vectorLen(arrow(b)) sin theta dot.c hat(n) $ 其中 $hat(n)$ 垂直于 $arrow(a)$ 和
$arrow(b)$ 所在的平面。遵守右手定则。

在右手坐标系中，有 $ arrow(x) times arrow(y) = +arrow(z) $

叉乘支持性质

$
  arrow(a) times arrow(b) = - arrow(b) times arrow(a) \
  arrow(a) times arrow(a) = arrow(0) \
  arrow(a) times (arrow(b) + arrow(c)) =
    arrow(a) times arrow(b) + arrow(a) times arrow(c) \
  arrow(a) times (k arrow(b)) = k (arrow(a) times arrow(b))
$

而且有

$
  arrow(a) times arrow(b) = vec(
    y_a z_b - y_b z_a,
    z_a x_b - x_a z_b,
    x_a y_b - y_a x_b
  )
$

或者可以表示为

$
  arrow(a) times arrow(b)
    = A^* arrow(b)
    = mat(0, -z_a, y_a;  z_a, 0, -x_a;  -y_a, x_a, 0) vec(x_b, y_b, z_b)
$

在图形学中，我们可以使用叉乘来判断一个向量在另外一个向量的左侧还是右侧。或者判断
一个点在例如三角形的内部还是外部。比如对于三角形 $A B C$，和一个点 $P$，我们可以
通过判断 $arrow(A B)$ 和 $arrow(A P)$、$arrow(B C)$ 和 $arrow(B P)$、
$arrow(C A)$ 和 $arrow(C P)$ 的叉乘方向来判断点 $P$ 在三角形内部还是外部。如果三
个叉乘方向都相同，那么点 $P$ 在三角形内部。否则，点 $P$ 在三角形外部。

我们认为如果有三个三维向量，满足

$
  vectorLen(arrow(u)) = vectorLen(arrow(v)) = vectorLen(arrow(w)) = 1 \
  arrow(u) dot.c arrow(v) = arrow(v) dot.c arrow(w) = arrow(w) dot.c arrow(u) = 0 \
  arrow(w) = arrow(u) times arrow(v)
$

那么我们称 $arrow(u), arrow(v), arrow(w)$ 为一组正交基（右手坐标系）。对于任意的
向量 $arrow(p)$，我们有

$
  arrow(p) =
    (arrow(p) dot.c arrow(u)) arrow(u) +
    (arrow(p) dot.c arrow(v)) arrow(v) +
    (arrow(p) dot.c arrow(w)) arrow(w)
$

=== 矩阵

矩阵就是一堆数。当我们说矩阵是 $m times n$ 的，那么它有 $m$ 行和 $n$ 列。

矩阵的乘积是矩阵最有用的操作。对于 $M times N$ 的矩阵和 $N times P$ 的矩阵，它们
的乘积为 $M times P$ 的矩阵。

矩阵的性质是：

+ 没有交换律。
+ $(A B)C = A(B C)$
+ $A(B + C) = A B + A C$
+ $(A + B)C = A C + B C$

当我们让矩阵和向量相乘，我们只需要将向量视为一个 $m times 1$ 的矩阵。

我们可以使用矩阵来表示变换。例如我们可以让二维向量按照 $y$ 轴翻转，那么有 $
mat(-1, 0; 0, 1) vec(x, y) = vec(-x, y) $

矩阵还有转置操作。即 $A^T$。只是将行和列互换。有性质 $(A B)^T = B^T A^T$。

我们还有单位矩阵。例如 $I_(3 times 3)$ 表示一个 $3 times 3$ 的单位矩阵，其中对角
线都为 $1$，其他都为 $0$。它有性质

$
  A^(-1) = A^(-1)A = I \
  (A B)^(-1) = B^(-1)A^(-1) \
$

有了矩阵的知识，那么我们可以将 $arrow(a) dot.c arrow(b)$ 表示为 $arrow(a)^T
arrow(b)$，然后将 $arrow(a) times arrow(b)$ 表示为 $A^* arrow(b)$。
