$(document).ready( function () {
    $('#table_id').DataTable({
        paging: false,
        searching: false,
        "info": false,
        columnDefs: [
            { orderable: false, targets: 7 }
        ]
    });
} );
