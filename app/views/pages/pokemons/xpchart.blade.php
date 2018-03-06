@extends('default.master')

@php
    $rows = 4;
@endphp

@section('content')
    <section>
        <div class="container">
            <table class="xp-table">
                <thead>
                <tr>
                    @for($i = 1;$i <= $rows; $i++)
                        <th>Level</th>
                        <th>Exp Needed</th>
                    @endfor
                </tr>
                </thead>
                <tbody>
                @for($i = 1;$i<=(100/$rows);$i++)
                    <tr>
                        @for($j = 0;$j < $rows; $j++)
                            <th>{{$i+$j*(100/$rows)}}</th>
                            <td>{{Pokemon::xpNeeded($i+$j*(100/$rows))}}</td>
                        @endfor
                    </tr>
                @endfor
                </tbody>
            </table>
        </div>
    </section>
@stop