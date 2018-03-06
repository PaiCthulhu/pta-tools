@extends('default.master')

@section('content')
    <section>
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th>Nature</th>
                        <th>Raises</th>
                        <th>Lowers</th>
                        <th>Likes</th>
                        <th>Dislikes</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($natures as $nature)
                        <tr>
                            <th>{{$nature->name}}</th>
                            <td>{{$nature->raise}}</td>
                            <td>{{$nature->lower}}</td>
                            <td>{{$nature->liked}}</td>
                            <td>{{$nature->disliked}}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </section>
@stop