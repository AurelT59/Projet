//Fonction de création du graphe
//----------------------------------------------------------------------------------------------
function create_graph(donnees, nutriment, val_recommendation, nom_nutriment, unite, debut, fin) {

    //Fonction pour déterminer le maximum en y
    function trouverValeurMax(donnees, nutriment, val_recommendation) {
        if (donnees.length === 0) {
            return undefined;
        }


        let valeurMax = val_recommendation;

        for (let i = 0; i < donnees.length; i++) {
            if (donnees[i].nutriments[nutriment] && (donnees[i].nutriments[nutriment].valeur > valeurMax)) {
                valeurMax = donnees[i].nutriments[nutriment].valeur;
            }
        }
        return valeurMax;
    }

    // Declare the chart dimensions and margins.
    const width = 740;
    const height = 400;
    const marginTop = 20;
    const marginRight = 200;
    const marginBottom = 60;
    const marginLeft = 60;

    // Declare the x (horizontal position) scale.
    const x = d3.scaleUtc()
        .domain([debut, fin])
        .range([marginLeft, width - marginRight]);

    // Declare the y (vertical position) scale.
    const maxi = trouverValeurMax(donnees, nutriment, val_recommendation);
    const marge_y = Math.floor(maxi / 3);
    const max_y = marge_y + parseFloat(maxi);
    const y = d3.scaleLinear()
        .domain([0, max_y])
        .range([height - marginBottom, marginTop]);

    // Create the SVG container.
    const svg = d3.select("#container") // Sélectionnez l'élément avec l'ID "container"
        .append("svg") // Ajoutez un élément SVG à l'intérieur de #container
        .attr("width", width)
        .attr("height", height);

    const formatDate = d3.timeFormat("%d/%m");


    // Créez l'axe en utilisant les valeurs de repère que vous avez calculées
    svg.append("g")
        .attr("transform", `translate(0,${height - marginBottom})`)
        .call(d3.axisBottom(x)
            .tickFormat(formatDate)
        );


    // Add the y-axis.
    svg.append("g")
        .attr("transform", `translate(${marginLeft},0)`)
        .call(d3.axisLeft(y));


    // Ajoutez des cercles pour les points de données
    svg.selectAll("circle")
        .data(donnees)
        .enter()
        .append("circle")
        .attr("cx", d => {
            jour = new Date(d.jour + "T00:00:00")
            return x(jour);
        })
        .attr("cy", d => {
            if (d.nutriments && d.nutriments[nutriment]) {
                return y(d.nutriments[nutriment].valeur);
            } else {
                return y(0);
            }
        })
        .attr("r", 4) // Rayon du cercle
        .attr("fill", "steelblue"); // Couleur des cercles

    // Ajoutez la ligne horizontale à la valeur 50
    svg.append("line")
        .attr("x1", marginLeft) // Coordonnée x du début de la ligne
        .attr("x2", width - marginRight) // Coordonnée x de la fin de la ligne
        .attr("y1", y(val_recommendation)) // Coordonnée y de la ligne (correspondant à la valeur 50)
        .attr("y2", y(val_recommendation)) // Coordonnée y de la ligne (correspondant à la valeur 50)
        .attr("stroke", "red") // Couleur de la ligne (par exemple, rouge)
        .attr("stroke-width", 2); // Épaisseur de la ligne


    //Gestion des légendes 
    //Axe x
    svg.append("text")
        .attr("x", (width - marginRight + marginLeft) / 2)
        .attr("y", height - 20)
        .style("text-anchor", "middle")
        .text("Jours");

    //Axe y
    svg.append("text")
        .attr("transform", "rotate(-90)")
        .attr("x", -height / 2)
        .attr("y", 15)
        .style("text-anchor", "middle")
        .text(nom_nutriment + "(" + unite + ")");

    //Ligne de recommendations
    svg.append("text")
        .attr("x", width - marginRight + 10)
        .attr("y", y(val_recommendation))
        .style("text-anchor", "start")
        .text("Recommendation par jour");

}

//----------------------------------------------------------------------------------------------


//Récupération des données
//----------------------------------------------------------------------------------------------

function getCookieValue(cookieName) {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i].trim();

        if (cookie.indexOf(cookieName + "=") === 0) {
            return decodeURIComponent(cookie.substring(cookieName.length + 1, cookie.length));
        }
    }

    return null;
}

var valeurDuCookie = JSON.parse(getCookieValue("session"));



//Récupération des données du journal
function correct_date(val) {
    if (val < 10) {
        return "0" + val
    }
    else {
        return "" + val
    }
}



function create_graph_with_date(debut, fin) {
    let stringdebut = debut.getFullYear() + "-" + correct_date(debut.getMonth() + 1) + "-" + correct_date(debut.getDate());
    let stringfin = fin.getFullYear() + "-" + correct_date(fin.getMonth() + 1) + "-" + correct_date(fin.getDate());

    $.ajax({
        url: URL_START + 'Backend/journal.php?date1=' + stringdebut + '&date2=' + stringfin + '&identifiant=' + valeurDuCookie.IDENTIFIANT,
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);

            function calculerNutriments(journaux) {
                const resultat = {};

                // Pour chaque journal, calculer la valeur pour chaque nutriment
                journaux.forEach(elem => {
                    const jour = elem.journal.DATE;

                    if (!resultat[jour]) {
                        resultat[jour] = { jour, nutriments: {} };
                    }

                    (elem.nutriments).forEach(nutriment => {
                        const quantite = parseFloat(elem.journal.QUANTITE);
                        const valeurPortion = parseFloat(nutriment.VALEUR_PORTION);
                        const resultatNutriment = quantite * valeurPortion;

                        if (!resultat[jour].nutriments[nutriment.ID_NUTRIMENT]) {
                            resultat[jour].nutriments[nutriment.ID_NUTRIMENT] = {
                                nom: nutriment.NOM,
                                valeur: 0,
                            };
                        }

                        if (nutriment.UNITE === 'kJ') {
                            // Convertir kJ en kcal (1 kJ = 0.239 kcal)
                            resultat[jour].nutriments[nutriment.ID_NUTRIMENT].valeur += resultatNutriment * 0.239;
                        } else if (nutriment.UNITE === 'mg') {
                            // Convertir mg en g
                            resultat[jour].nutriments[nutriment.ID_NUTRIMENT].valeur += resultatNutriment * 0.001;
                        } else {
                            resultat[jour].nutriments[nutriment.ID_NUTRIMENT].valeur += resultatNutriment;
                        }
                    });
                });

                // Convertir l'objet résultat en un tableau
                const resultatFinal = Object.values(resultat);

                return resultatFinal;
            }


            const resultats = calculerNutriments(data);
            console.log(resultats);

            //Insertion des données dans le graphe
            //----------------------------------------------------------------------------------------------

            $.ajax({
                url: URL_START + 'Backend/recommendations.php?identifiant=' + valeurDuCookie.IDENTIFIANT,
                method: 'GET',
                dataType: 'json',
                success: function (data) {
                    const tab_reco = data;

                    if ($("#selectNut").val() != null) {
                        id_select = $("#selectNut").val();
                    }
                    else {
                        id_select = 9;
                    }

                    $.ajax({
                        url: URL_START + 'Backend/nomenclature.php',
                        method: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            console.log(data);

                            //Initialisation de la nomenclature des nutriments
                            let contenu_select_nutriments = "";
                            let tab_nutriments = data.nutriments;
                            for (let i = 0; i < tab_nutriments.length; i++) {
                                if (tab_nutriments[i].ID_NUTRIMENT == id_select) {
                                    contenu_select_nutriments += "<option value=" + tab_nutriments[i].ID_NUTRIMENT + " selected>" + tab_nutriments[i].NOM + "</option>";
                                }
                                else {
                                    contenu_select_nutriments += "<option value=" + tab_nutriments[i].ID_NUTRIMENT + ">" + tab_nutriments[i].NOM + "</option>";
                                }
                            }
                            $("#selectNut").html(contenu_select_nutriments);


                            //Fonction pour initialiser le graphe
                            function init_graphe(nutriment, date_debut, date_fin) {
                                $("#container").html("");
                                let val_recommendation = 0;

                                for (let i = 0; i < tab_reco.length; i++) {
                                    if (tab_reco[i].ID_NUTRIMENT == nutriment) {
                                        val_recommendation = tab_reco[i].QUANTITE;
                                    }
                                }

                                let unite = "g"
                                if (nutriment == 9) {
                                    unite = "kcal"
                                }
                                let nom = $("#selectNut option[value=" + nutriment + "]").text();

                                create_graph(resultats, nutriment, val_recommendation, nom, unite, date_debut, date_fin);
                            }


                            //Initialisation par défaut
                            init_graphe($("#selectNut").val(), debut, fin);

                            //Changement du graphe à chaque sélection
                            $("#selectNut").on("change", function (e) {
                                init_graphe($("#selectNut").val(), debut, fin);
                            })
                        },
                        error: function (error) {
                            console.error('Erreur lors de l\'importation des données de nomenclature : ', error);
                        }
                    })
                },
                error: function (error) {
                    console.error('Erreur lors de l\'importation des données de recommendations : ', error);
                }
            })

            //----------------------------------------------------------------------------------------------

        },
        error: function (error) {
            if (error.status == 404) {
                console.error('Vous n\'avez pas de données dans le journal');
                $("#selectNut").hide();
                $("#container").html("Vous n\'avez pas d'historique pour l'instant");
            }
            else {
                console.error('Erreur lors de l\'importation des données du journal : ', error);
            }
        }
    })
}
//----------------------------------------------------------------------------------------------


//Initialisation des dates
// Calculer la date actuelle
const dateActuelle = new Date();

// Calculer la date 1 semaine avant la date actuelle
const dateUneSemaineAvant = new Date(dateActuelle);
dateUneSemaineAvant.setDate(dateActuelle.getDate() - 7);

const stringdateUneSemaineAvant = dateUneSemaineAvant.getFullYear() + "-" + correct_date(dateUneSemaineAvant.getMonth() + 1) + "-" + correct_date(dateUneSemaineAvant.getDate());
const stringdateActuelle = dateActuelle.getFullYear() + "-" + correct_date(dateActuelle.getMonth() + 1) + "-" + correct_date(dateActuelle.getDate());

$("#selectDebut").val(stringdateUneSemaineAvant);
$("#selectFin").val(stringdateActuelle);

create_graph_with_date(dateUneSemaineAvant, dateActuelle);


//Changement du graphe en fonction des dates sélectionnées

$("#selectDebut").on("input", function (e) {
    let start = new Date($("#selectDebut").val());
    let finish = new Date($("#selectFin").val());
    create_graph_with_date(start, finish);
})

$("#selectFin").on("input", function (e) {
    let start = new Date($("#selectDebut").val());
    let finish = new Date($("#selectFin").val());
    create_graph_with_date(start, finish);
})


// Remplissage barres d'avancement journée

$.ajax({
    url: URL_START + 'Backend/journal.php?date1=' + stringdateActuelle + '&date2=' + stringdateActuelle + '&identifiant=' + valeurDuCookie.IDENTIFIANT,
    method: 'GET',
    dataType: 'json',
    success: function (data) {
        console.log(data);

        function calculerNutriments(journaux) {
            const resultat = {};

            // Pour chaque journal, calculer la valeur pour chaque nutriment
            journaux.forEach(elem => {
                const jour = elem.journal.DATE;

                if (!resultat[jour]) {
                    resultat[jour] = { jour, nutriments: {} };
                }

                (elem.nutriments).forEach(nutriment => {
                    const quantite = parseFloat(elem.journal.QUANTITE);
                    const valeurPortion = parseFloat(nutriment.VALEUR_PORTION);
                    const resultatNutriment = quantite * valeurPortion;

                    if (!resultat[jour].nutriments[nutriment.ID_NUTRIMENT]) {
                        resultat[jour].nutriments[nutriment.ID_NUTRIMENT] = {
                            nom: nutriment.NOM,
                            valeur: 0,
                        };
                    }

                    if (nutriment.UNITE === 'kJ') {
                        // Convertir kJ en kcal (1 kJ = 0.239 kcal)
                        resultat[jour].nutriments[nutriment.ID_NUTRIMENT].valeur += resultatNutriment * 0.239;
                    } else if (nutriment.UNITE === 'mg') {
                        // Convertir mg en g
                        resultat[jour].nutriments[nutriment.ID_NUTRIMENT].valeur += resultatNutriment * 0.001;
                    } else {
                        resultat[jour].nutriments[nutriment.ID_NUTRIMENT].valeur += resultatNutriment;
                    }
                });
            });

            // Convertir l'objet résultat en un tableau
            const resultatFinal = Object.values(resultat);

            return resultatFinal;
        }


        const resultats = calculerNutriments(data);
        console.log("resultats");
        console.log(resultats);

        //Insertion des données dans les barres
        //----------------------------------------------------------------------------------------------

        $.ajax({
            url: URL_START + 'Backend/recommendations.php?identifiant=' + valeurDuCookie.IDENTIFIANT,
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                const tab_reco = data;

                $.ajax({
                    url: URL_START + 'Backend/nomenclature.php',
                    method: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);

                        //Initialisation de la nomenclature des nutriments
                        let tab_nutriments = data.nutriments;
                        let conso = resultats[0].nutriments;

                        console.log("nutriments");
                        console.log(tab_nutriments);

                        let contenu_apport_jour = "";
                        for (let i = 0; i < tab_reco.length; i++) {
                            let found = false;
                            let unit = "g";
                            for (j in conso) {
                                if ((conso[j].valeur != undefined) && (tab_nutriments[i].NOM == conso[j].nom)) {

                                    if (tab_nutriments[i].NOM == "Énergie") {
                                        unit = "kcal";
                                    }

                                    let quantite_recommandee = Number(tab_reco[i].QUANTITE);
                                    ratio = 100 * (conso[j].valeur / quantite_recommandee);

                                    if (ratio <= 100) {
                                        contenu_apport_jour += "<label class='form-label bar-and-title'>" + tab_nutriments[i].NOM + " : " + conso[j].valeur.toFixed(2) + " / " + tab_reco[i].QUANTITE + unit + "</label><div class='progress' role='progressbar' aria-valuemin='0' aria-valuemax='100'> <div class='progress-bar' style='width: " + ratio + "%'>" + ratio.toFixed(0) + "%</div></div>";
                                    } else {
                                        contenu_apport_jour += "<label class='form-label bar-and-title'>" + tab_nutriments[i].NOM + " : " + conso[j].valeur.toFixed(2) + " / " + tab_reco[i].QUANTITE + unit + "</label><div class='progress' role='progressbar' aria-valuemin='0' aria-valuemax='100'> <div class='progress-bar bg-danger' style='width: " + ratio + "%'>" + ratio.toFixed(0) + "%</div></div>";

                                    }
                                    found = true;
                                }
                            }

                            if (found == false) {
                                contenu_apport_jour += "<label class='form-label bar-and-title'>" + tab_nutriments[i].NOM + " : 0 / " + tab_reco[i].QUANTITE + unit + "</label><div class='progress' role='progressbar' aria-valuemin='0' aria-valuemax='100'> <div class='progress-bar' style='width: 0%'>0%</div></div>";

                            }
                        }

                        $("#affichageApports").html(contenu_apport_jour);

                    },
                    error: function (error) {
                        console.error('Erreur lors de l\'importation des données de nomenclature : ', error);
                    }
                })
            },
            error: function (error) {
                console.error('Erreur lors de l\'importation des données de recommendations : ', error);
            }
        })

        //----------------------------------------------------------------------------------------------


    },
    error: function (error) {
        if (error.status == 404) {
            console.error('Vous n\'avez pas de données dans le journal');
            $("#selectNut").hide();
            $("#container").html("Vous n\'avez pas d'historique pour l'instant");
        }
        else {
            console.error('Erreur lors de l\'importation des données du journal : ', error);
        }
    }
})
//----------------------------------------------------------------------------------------------