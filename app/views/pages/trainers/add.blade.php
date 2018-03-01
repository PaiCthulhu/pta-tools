@extends('default.master')


@section('content')
    <section>
        <div class="container">
            <div class="card full">
                <div class="card-header">
                    <a href="{{PATH.DS.'admin'.DS.'usuarios'}}" class="float-right"><< Voltar</a>
                    <h5 class="card-title">@include('default.icon',['i'=>'user-plus','t'=>'s']) &nbsp;Novo Treinador </h5>
                </div>
                <div class="card-body">
                    {!! dump($trainer) !!}
                    <table>
                        <tr>
                            <th>Name</th>
                            <td colspan="3">{{$trainer->titledName()}}</td>
                            <th>L</th>
                            <td>{{$trainer->level()}}</td>
                            <th>Player</th>
                            <td>{{$trainer->player()}}</td>
                        </tr>
                        <tr>
                            <th>Age</th>
                            <td>{{$trainer->age()}} y</td>
                            <th>Height</th>
                            <td>{{$trainer->height()}}m</td>
                            <th>Weight</th>
                            <td>{{$trainer->weight()}}kg</td>
                        </tr>
                    </table>
                    <table>
                        <thead>
                            <tr>
                                <th>Stat</th>
                                <th>Value</th>
                                <th>Mod</th>
                                <th>Stages</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach(Trainer::statNames as $i=>$stat)
                            <tr>
                                <th>{{strtoupper($stat)}}</th>
                                <td>{{$trainer->stat($stat)}}</td>
                                <td>{{$trainer->plusSign($trainer->statMod($stat))}}</td>
                                <td>{{$trainer->plusSign($trainer->combatStage($stat))}}</td>
                                @php
                                $othersHeader = ['LP','Perception','Evasion','Speed','Defense','Sp. Defense'];
                                $otherValue = [$trainer->maxHP(), $trainer->perception(),"",$trainer->spdEvasion(),$trainer->defEvasion(),$trainer->sdefEvasion()];
                                @endphp
                                <th @if($i==2) colspan="2" @endif>{{$othersHeader[$i]}}</th>
                                <td>{{$otherValue[$i]}}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                    {{--<form>
                        <div class="form-group">
                            <label for="nome">Nome:</label>
                            <input type="text" id="nome" name="name" class="form-control" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label for="usuario">Usuário:</label>
                            <input type="text" id="usuario" name="user" class="form-control" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label for="email">E-mail:</label>
                            <input type="email" id="email" name="mail" class="form-control" autocomplete="off" />
                        </div>
                        <div class="form-group">
                            <label for="senha">Senha:</label>
                            <input type="password" id="senha" name="pswd" class="form-control" autocomplete="off" />
                        </div>
                        <div class="form-group text-center">
                            <button class="btn btn-primary" type="submit">Salvar</button>
                        </div>
                    </form>--}}
                </div>
            </div>
        </div>

    </section>
@stop