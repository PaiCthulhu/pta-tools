@extends('default.master')

@section('content')
    <section>
        <div class="container">
            <table class="typematch">
                <thead>
                <tr>
                    @foreach($types as $type)
                        <th style="background-color: #{{$type->color}};">{{$type->name}}</th>
                    @endforeach
                </tr>
                </thead>
                <tbody>
                @foreach($types as $type)
                    @if($type->type_id > 0)
                        <tr>
                            <th style="background-color: #{{$type->color}};">{{$type->name}}</th>
                            @foreach(json_decode($type->effect) as $i=>$effect)
                                @if($i > 0)
                                    <td class="eff{{str_replace('.','-',$effect)}}">&times;{!! ($effect == '0.5')? '&half;':$effect !!}</td>
                                @endif
                            @endforeach
                        </tr>
                    @endif
                @endforeach
                </tbody>
            </table>
        </div>
    </section>
<style>
    .typematch th, .typematch td{width: 65px; text-align: center;color: white;}
    .eff1{color: black !important;}
    .eff2{background-color: #33cc33e6;}
    .eff0-5{background-color: #cc3333e6;}
    .eff0{background-color: #505050e6;}
</style>
@stop