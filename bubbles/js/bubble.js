var bubbles;
var diameter = 400, //max size of the bubbles
//color    = d3.scale.linear().domain([costMin,costMax]).range(['#0075B4', '#70B5DC'])
//d3.scale.category20b(), //color category
format = d3.format(",d")
var bubble = d3.layout.pack()
.sort(null)
.size([diameter, diameter])
.padding(1.5);

var tooltip = d3.select("body")
.append("div")
.style("position", "absolute")
.style("z-index", "10")
.style("visibility", "hidden")
.style("color", "white")
.style("padding", "8px")
.style("background-color", "rgba(0, 0, 0, 0.75)")
.style("border-radius", "6px")
.style("font", "12px sans-serif")
.text("tooltip")
.attr("id","tooltip");


var svg = d3.select("body")
.append("svg")
.attr("id",'svg1')
.attr("width", diameter)
.attr("height", diameter)
.attr("class", "bubble");

var svg2 = d3.select("body")
.append("svg")
.attr("id","svg2")
.attr("width", diameter)
.attr("height", diameter)
.attr("class", "bubble");

var path;
var path2;

function init() {
    var region = getRegion().replace(/ /g,"_");
    path = "./data/nyt/wc_"+getYear()+".csv"
    path2 = "./data/wc_gtd/"+getYear()+"/wc_"+region+".csv"
    update(path)
    update(path2)
}

function getYear(){
    var node = d3.select('#yeardropdown').node();
    var i = node.selectedIndex;
    return node[i].value;
  }
  
  // Returns the selected option in the X-axis dropdown. 
function getRegion(){
    var node = d3.select('#regiondropdown').node();
    var i = node.selectedIndex;
    return node[i].value;
}

function updateClicked(){
    d3.select("#svg1").remove()
    d3.select("#svg2").remove()
    d3.select("#tooltip").remove()
    svg = d3.select("body")
    .append("svg")
    .attr("id",'svg1')
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble");
    svg2 = d3.select("body")
    .append("svg")
    .attr("id",'svg2')
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble");
    tooltip = d3.select("body")
    .append("div")
    .style("position", "absolute")
    .style("z-index", "10")
    .style("visibility", "hidden")
    .style("color", "white")
    .style("padding", "8px")
    .style("background-color", "rgba(0, 0, 0, 0.75)")
    .style("border-radius", "6px")
    .style("font", "12px sans-serif")
    .text("tooltip")
    .attr("id","tooltip");

    var region = getRegion().replace(/ /g,"_");
    path = "./data/nyt/wc_"+getYear()+".csv"
    path2 = "./data/wc_gtd/"+getYear()+"/wc_"+region+".csv"

    update(path)
    try{
        update(path2)
    }
    catch(err) {
        console.log("err")
    }
}

function update(path) {
    d3.csv(path, function(error, data){
            if(error) {
                console.log("File not found");
                bubbles.append("text")
                .attr("text-anchor", "middle")
                .text("no data")
                .style({
                    "fill":"black", 
                    "font-family":"Helvetica Neue, Helvetica, Arial, san-serif",
                    "font-size": "8px"
                })
                .style("pointer-events", "none");
                return;
            }
            
            //convert numerical values from strings to numbers
            data = data.map(function(d){
                d.word = d["word"];
                d.value = +d["count"]; 
                return d; 
            });
            
            var max = d3.max(data, function(d) { return d.value; });
            var min = d3.min(data, function(d) { return d.value; });
    
            //bubbles needs very specific format, convert data to this.
            var nodes = bubble.nodes({children:data}).filter(function(d) { return !d.children; });
        
            
            var isNYT = path.indexOf("nyt")!==-1;
            if(isNYT) {
                bubbles = svg.append("g")
                .attr("transform", "translate(0,0)")
                .selectAll(".bubble")
                .data(nodes)
                .enter();
            }
            else {
                bubbles = svg2.append("g")
                .attr("transform", "translate(0,0)")
                .selectAll(".bubble")
                .data(nodes)
                .enter();
            }
            
        
            //create the bubbles
            bubbles.append("circle")
                .attr("r", function(d){ return d.r; })
                .attr("cx", function(d){ return d.x; })
                .attr("cy", function(d){ return d.y; })
                .style("fill", function(d) {
                    var color;
                    if(isNYT) {
                        color = function() {return '#BBE5DD'}
                    }
                    else {
                        color = d3.scale.linear().domain([min,max]).range(['#FDB47B', '#C15412']) 
                    }
                    
                    var x = color(d.value);
                    return x;
                })
                .on("mouseover", function(d) {
                    tooltip.text(d.word + ": " + format(d.value));
                    tooltip.style("visibility", "visible");
                })
                .on("mousemove", function() {
                return tooltip.style("top", (d3.event.pageY-10)+"px").style("left",(d3.event.pageX+10)+"px");
                })
                .on("mouseout", function(){return tooltip.style("visibility", "hidden");});
        
            //format the text for each bubble
            bubbles.append("text")
                .attr("x", function(d){ return d.x; })
                .attr("y", function(d){ return d.y + 5; })
                .attr("text-anchor", "middle")
                .text(function(d){ return d["word"]; })
                .style({
                    "fill":"black", 
                    "font-family":"Helvetica Neue, Helvetica, Arial, san-serif",
                    "font-size": "8px"
                })
                .style("pointer-events", "none");
        })
}
