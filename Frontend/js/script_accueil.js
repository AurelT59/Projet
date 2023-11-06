// Declare the chart dimensions and margins.
const width = 640;
const height = 400;
const marginTop = 20;
const marginRight = 20;
const marginBottom = 30;
const marginLeft = 40;

// Calculer la date actuelle
const dateActuelle = new Date();

// Calculer la date 1 semaine avant la date actuelle
const dateUneSemaineAvant = new Date(dateActuelle);
dateUneSemaineAvant.setDate(dateActuelle.getDate() - 7);

// Declare the x (horizontal position) scale.
const x = d3.scaleUtc()
    .domain([dateUneSemaineAvant, dateActuelle])
    .range([marginLeft, width - marginRight]);

// Declare the y (vertical position) scale.
const y = d3.scaleLinear()
    .domain([0, 100])
    .range([height - marginBottom, marginTop]);

// Create the SVG container.
const svg = d3.select("#container") // Sélectionnez l'élément avec l'ID "container"
    .append("svg") // Ajoutez un élément SVG à l'intérieur de #container
    .attr("width", width)
    .attr("height", height);

const formatDate = d3.timeFormat("%d/%m");


// Add the x-axis.
svg.append("g")
    .attr("transform", `translate(0,${height - marginBottom})`)
    .call(d3.axisBottom(x).tickFormat(formatDate));

// Add the y-axis.
svg.append("g")
    .attr("transform", `translate(${marginLeft},0)`)
    .call(d3.axisLeft(y));

const donnees = [
    { date: new Date("2023-11-06"), valeur: 30 },
    { date: new Date("2023-11-05"), valeur: 40 },
    { date: new Date("2023-11-03"), valeur: 60 },
    // Ajoutez autant de points de données que nécessaire
];

// Ajoutez des cercles pour les points de données
svg.selectAll("circle")
    .data(donnees)
    .enter()
    .append("circle")
    .attr("cx", d => x(d.date))
    .attr("cy", d => y(d.valeur))
    .attr("r", 4) // Rayon du cercle
    .attr("fill", "steelblue"); // Couleur des cercles

// Ajoutez la ligne horizontale à la valeur 50
svg.append("line")
    .attr("x1", marginLeft) // Coordonnée x du début de la ligne
    .attr("x2", width - marginRight) // Coordonnée x de la fin de la ligne
    .attr("y1", y(50)) // Coordonnée y de la ligne (correspondant à la valeur 50)
    .attr("y2", y(50)) // Coordonnée y de la ligne (correspondant à la valeur 50)
    .attr("stroke", "red") // Couleur de la ligne (par exemple, rouge)
    .attr("stroke-width", 2); // Épaisseur de la ligne

