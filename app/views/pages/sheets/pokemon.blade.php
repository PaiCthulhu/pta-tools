@extends('default.a4page')

@section('page')
<div class="subpage">
    <div id="sheet" class="container">
        <div class="row" id="header">
            <div id="logo" class="col-2">
                    <img class="display" src="https://i.pinimg.com/originals/88/7d/71/887d71579e5b30748f8128faf7799c48.jpg" />
            </div>
            <div class="col container">
                <div class="row">
                    <div class="label">Name: </div>
                    <div class="field col"></div>
                </div>
                <div class="row">
                        <div class="label">Species: </div>
                        <div class="field col-3"></div>
                        <div class="label">Type: </div>
                        <div class="field col"></div>
                        <div class="label"> / </div>
                        <div class="field col"></div>
                        <div class="label">Gender: </div>
                        <div>[ ]♂ [ ]♀ [ ]♦</div>
                </div>
                <div class="row">
                        <div class="label">Level: </div>
                        <div class="field col"></div>
                        <div class="label">Exp: </div>
                        <div class="field col"></div>
                        <div class="label"> / </div>
                        <div class="field col"></div>
                        <div class="label">Loyalty: </div>
                        <div class="field col-1"></div>
                </div>
                <div class="row">
                    <div class="label">Held Item: </div>
                    <div class="field col-3"></div>
                    <div class="label">Nature: </div>
                    <div class="field col-2"></div>
                    <div class="label">( + </div>
                    <div class="field col"></div>
                    <div class="label"> / &minus; </div>
                    <div class="field col"></div>
                    <div class="label">)</div>
                </div>
            </div>
        </div>
        <br/>
        <div class="row row-tables" id="stats">
            <div class="col">
                <table class="stats">
                    <thead>
                    <tr>
                        <th>STAT</th>
                        <th> &nbsp;BASE&nbsp; </th>
                        <th> &nbsp;ADDED&nbsp; </th>
                        <th> &nbsp;TOTAL&nbsp; </th>
                        <th>COMBAT</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr><th>HP</th><td></td><td></td><td></td><th>STAGES</th></tr>
                        <tr><th>ATK</th><td></td><td></td><td></td><td></td></tr>
                        <tr><th>DEF</th><td></td><td></td><td></td><td></td></tr>
                        <tr><th>&nbsp;SP.ATK&nbsp;</th><td></td><td></td><td></td><td></td></tr>
                        <tr><th>SP.DEF</th><td></td><td></td><td></td><td></td></tr>
                        <tr><th>SPD</th><td></td><td></td><td></td><td></td></tr>
                    </tbody>
                </table>
            </div>
            <div class="col-5">
                <table class="stats">
                    <tr>
                        <th>LP</th>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th>STAB</th>
                        <td colspan="2"></td>
                    </tr>
                </table>
                <br/>
                <table class="stats">
                    <thead>
                    <tr>
                        <th colspan="2">EVASION</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>Physical</th><td></td>
                    </tr>
                    <tr>
                        <th>Special</th><td></td>
                    </tr>
                    <tr>
                        <th>Speed</th><td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <br/>
        <div class="row row-tables" id="skills">
            <div class="col">
                <table class="stats">
                    <thead>
                    <tr>
                        <th>Skill</th>
                        <th>Value</th>
                        <th>Notes</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr><th>Overland</th><td class="value"></td><td></td></tr>
                    <tr><th>Surface</th><td class="value"></td><td></td></tr>
                    <tr><th>Underwater</th><td class="value"></td><td></td></tr>
                    <tr><th>Sky</th><td class="value"></td><td></td></tr>
                    <tr><th>Burrow</th><td class="value"></td><td></td></tr>
                    <tr><th>Jump</th><td class="value"></td><td></td></tr>
                    <tr><th>Power</th><td class="value"></td><td></td></tr>
                    <tr><th>Intelligence</th><td class="value"></td><td></td></tr>
                    </tbody>
                </table>
            </div>
            <div class="col-5">
                <div class="container">
                    <div class="row">
                        <table class="stats">
                            <thead>
                            <tr>
                                <th>Abilities</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="label">Diet: </div>
                        <div class="field col"></div>
                    </div>
                    <div class="row">
                        <div class="label">Height: </div>
                        <div class="field col"></div>
                        <div class="label">m </div>
                    </div>
                    <div class="row">
                        <div class="label">Weight: </div>
                        <div class="field col"></div>
                        <div class="label">kg </div>
                    </div>
                    <div class="row">
                        <div class="label">Size: </div>
                        <div class="field col"></div>
                        <div class="label">W.Class: </div>
                        <div class="field col"></div>
                    </div>
                    <div class="row">
                        <div class="label">Vitamins: </div>
                        <div class="field col"></div>
                    </div>
                    <div class="row">
                        <div class="field col">&nbsp;</div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <div class="row" id="moves">
            <div class="container row" style="padding-right: 0;">
                <p><b>Natural Moves</b>(Level / Egg)</p>
                @include('pages.sheets.includes.movetable')
            </div>
            <div class="container row" style="padding-right: 0;">
                <p><br/><b>Techinical Moves</b>(TM/HM / Tutor)</p>
                @include('pages.sheets.includes.movetable')
            </div>
        </div>
        <br/>
        <div class="row" id="notes">
            <div class="col container">
                <div class="row">
                    <div class="label">Notes: </div>
                    <div class="field col"></div>
                </div>
                <div class="row">
                    <div class="field col">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="field col">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="field col">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="field col">&nbsp;</div>
                </div>
                <div class="row">
                    <div class="field col">&nbsp;</div>
                </div>
            </div>
            <div class="col-3" style="padding-right: 0;">
                <table class="stats">
                    <thead>
                    <tr>
                        <th colspan="2">Contest</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr><th>Cool</th><td>&nbsp;</td></tr>
                    <tr><th>Tough</th><td>&nbsp;</td></tr>
                    <tr><th>Beauty</th><td>&nbsp;</td></tr>
                    <tr><th>Smart</th><td>&nbsp;</td></tr>
                    <tr><th>Cute</th><td>&nbsp;</td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@stop