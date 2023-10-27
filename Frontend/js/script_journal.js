$(document).ready(function () {
    let table = new DataTable('#table_journal', {
        columnDefs: [{
            targets: 0,
            data: 'date'
        },
        {
            targets: 1,
            data: 'aliment'
        },
        {
            targets: 2,
            data: null,
            render: function (data, type, row) {
                return '<button id="edit" onclick="onEditSubmit();">Éditer</button><button id="delete" onclick="onDeleteSubmit();">Supprimer</button>';
            }
        }
        ]
    });
});