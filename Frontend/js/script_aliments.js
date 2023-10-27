$(document).ready(function () {
    let table = new DataTable('#table_aliments', {
        columnDefs: [{
            targets: 0,
            data: 'Nom'
        },
        {
            targets: 1,
            data: null,
            render: function (data, type, row) {
                return '<button id="edit" onclick="onEditSubmit();">Éditer</button><button id="delete" onclick="onDeleteSubmit();">Supprimer</button>';
            }
        }
        ]
    });
});