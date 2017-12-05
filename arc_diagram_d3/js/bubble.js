var bubbles;
var diameter = 600, 
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
.style("width", "300px")
.style("padding", "8px")
.style("background-color", "rgba(0, 0, 0, 0.75)")
.style("border-radius", "6px")
.style("font", "12px sans-serif")
.text("tooltip")
.attr("id","tooltip");


var svg2 = d3.select("body")
.append("svg")
.attr("id","svg2")
.attr("width", diameter)
.attr("height", diameter)
.attr("class", "bubble");

var path;

function initBubbles() {
    var region = getRegion().replace(/ /g,"_");
    path = "./data/proc/top_key/"+getYear()+"/"+region+".csv"
    console.log(region)
    update(path)
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

    d3.select("#svg2").remove()
    d3.select("#tooltip").remove()
    
    svg2 = d3.select("body")
    .append("svg")
    .attr("id",'svg2')
    .attr("width", diameter)
    .attr("height", diameter)
    .attr("class", "bubble");
    tooltip = d3.select("body")
    .append("div")
    .style("position", "absolute")
    .style("width", "300px")
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
    path = "./data/proc/top_key/"+getYear()+"/"+region+".csv"
    update(path)
}

function loadCSV(path) {
    d3.csv(path, function(error, data){
        if(error) {
            console.log("File not found");
            bubbles.append("text")
            .attr("text-anchor", "middle")
            .text("no data")
            .style({
                "fill":"black", 
                "font-family":"Helvetica Neue, Helvetica, Arial, san-serif",
                "font-size": "12px"
            })
            .style("pointer-events", "none");
            return;
        }
        
        data = data.map(function(d){
            d.word = d["keyword"]
            d.value = +d["score"]; 
            d.date = d["date"];
            d.gname = d["gname"];
            d.nkill = +d["nkill"];
            d.nwound = +d["nwound"];
            summary = d["date"]+": "+d["summary"]+" Deaths: "+d.nkill+" , Wounded: "+d.nwound;
            d.summary = summary;
            return d; 
        });
        
        var max = d3.max(data, function(d) { return d.value; });
        var min = d3.min(data, function(d) { return d.value; });

        var nodes = bubble.nodes({children:data}).filter(function(d) { return !d.children; });
    
        bubbles = svg2.append("g")
        .attr("transform", "translate(0,0)")
        .selectAll(".bubble")
        .data(nodes)
        .enter();
    
        //create the bubbles
        bubbles.append("circle")
            .attr("r", function(d){ return d.r; })
            .attr("cx", function(d){ return d.x; })
            .attr("cy", function(d){ return d.y; })
            .attr("class", function(d){ return d.gname + " " + "terror_group";})
            .style("fill", function(d) {
                var color;
                
                //color = d3.scale.linear().domain([min,max]).range(['#FDB47B', '#C15412']) 
                //var x = color(d.value);
                x = '#BB5616';
                return x;
            })
            .on("mouseover", function(d) {
                tooltip.text(d.summary);
                tooltip.style("visibility", "visible");
            })
            .on("mousemove", function() {
            twidth = (d3.event.pageX+10)
            return tooltip.style("top", (d3.event.pageY-10)+"px").style("left",twidth+"px");
            })
            .on("mouseout", function(){return tooltip.style("visibility", "hidden");});
    
        //format the text for each bubble
        var font_size;
        bubbles.append("text")
            .attr("x", function(d){ return d.x; })
            .attr("y", function(d){ return d.y + 5; })
            .attr("text-anchor", "middle")
            .attr("font-size", function(d){
                font_size = 3.6*d.r/d.keyword.length;
                if(font_size<=5)
                    font_size = 0;
                return font_size;
            })//
            .text(function(d){
                phrase = d["word"]
                if(d.r<20)
                phrase=''
            return phrase })
            .style({
                "fill":"black", 
                "font-family":"Helvetica Neue, Helvetica, Arial, san-serif",
                "max-width": "100px",
                "word-wrap": "break-word"
            })
            .style("pointer-events", "none");
        
    })
}

function update(path) {
    loadCSV(path);
}
