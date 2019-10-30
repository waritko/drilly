function updateMiss(prefix)
{
    var head = $('#' + prefix + 'head');
    var alpha = $('#' + prefix + 'alpha');
    var charlie = $('#' + prefix + 'charlie');
    var delta = $('#' + prefix + 'delta');
    var miss = $('#' + prefix + 'miss');
    var totalHits = parseInt(head.prop('max') ? head.prop('max') : '0', 10) + parseInt(alpha.prop('max') ? alpha.prop('max') : '0', 10);
    var currentHits = parseInt(head.val(), 10) + parseInt(alpha.val(), 10) + parseInt(charlie.val(), 10) + parseInt(delta.val(), 10);
    miss.val(totalHits - currentHits);
}
