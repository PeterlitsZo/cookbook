use std::net::SocketAddr;

use axum::Router;
use indoc::formatdoc;
use tower_http::services::ServeDir;

pub async fn serve_public() {
    let addr = SocketAddr::from(([127, 0, 0, 1], 8080));
    let listener = tokio::net::TcpListener::bind(addr).await.unwrap();
    let app = Router::new().fallback_service(ServeDir::new("public"));
    println!("Listening on {}", addr);
    axum::serve(listener, app)
        .await
        .unwrap();
}

pub fn build_public_as_line_chart(data: Vec<f64>) {
    let data_json = serde_json::to_string(&data).unwrap();
    let html = formatdoc!{ r###"
        <!DOCTYPE html>
        <html>
          <head>
            <title>Standard Brownian Motion</title>
          </head>
          <body>
            <div id="container"></div>
            <textarea id="svgData"></textarea>
            <script type="module">
              import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";

              const data = {data_json};

              const width = 640;
              const height = 400;
              const marginTop = 20;
              const marginRight = 20;
              const marginBottom = 30;
              const marginLeft = 50;

              const x = d3.scaleLinear()
                .domain([0, data.length])
                .range([marginLeft, width - marginRight]);

              const y = d3.scaleLinear()
                .domain([d3.min(data), d3.max(data)])
                .range([height - marginBottom, marginTop]);

              const line = d3.line()
                .x((d, i) => x(i))
                .y(d => y(d));

              const svg = d3.select("#container")
                .append("svg")
                .attr("width", width)
                .attr("height", height)
                .attr("viewBox", [0, 0, width, height])
                .attr("xmlns", "http://www.w3.org/2000/svg")
                .attr("version", "1.1")
                .attr("style", "max-width: 100%; height: auto; height: intrinsic;");

              const xAxis = g => g
                .attr("transform", `translate(0, ${{height - marginBottom}})`)
                .call(d3.axisBottom(x).ticks(width / 80).tickSizeOuter(0));

              const yAxis = g => g
                .attr("transform", `translate(${{marginLeft}}, 0)`)
                .call(d3.axisLeft(y))
                .call(g => g.select(".domain").remove())
                .call(g => g.selectAll(".tick line").clone()
                  .attr("x2", width - marginLeft - marginRight)
                  .attr("stroke-opacity", 0.1));

              const path = svg.append("path")
                .datum(data)
                .attr("fill", "none")
                .attr("stroke", "steelblue")
                .attr("stroke-width", 1.5)
                .attr("d", line);

              svg.append("g")
                .call(xAxis);
              svg.append("g")
                .call(yAxis);

              const svgData = document.getElementById("svgData");
              svgData.value = svg.node().outerHTML;
            </script>
          </body>
        </html>
    "### };

    std::fs::remove_dir_all("public").unwrap();
    std::fs::create_dir_all("public").unwrap();
    std::fs::write("public/index.html", html).unwrap();
}
