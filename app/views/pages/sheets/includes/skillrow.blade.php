@if($skill->stat != 'base')
    <tr>
        <th class="gray">{{$skill->name}}</th>
        <td></td>
        <td class="text-center">{{Trainer::statsDisplayNames[mb_strtoupper($skill->stat)]}}</td>
    </tr>
@endif