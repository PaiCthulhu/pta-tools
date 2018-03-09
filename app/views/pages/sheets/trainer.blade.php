@extends('default.a4page')

@section('page')
<div class="subpage">
    <div id="sheet" class="container">
        <div class="row" id="header">
            <div id="logo" class="col-2">
                <img class="display" src="{{PATH}}{{DS}}public{{DS}}img{{DS}}trainer.png" />
            </div>
            <div class="col container">
                <div class="row">
                    <div class="label">Name: </div>
                    <div class="field col"></div>
                    <div class="label">Player Name: </div>
                    <div class="field col-3"></div>
                </div>
                <div class="row">
                    <div class="label">Age: </div>
                    <div class="field col"></div>
                    <div class="label">Gender: </div>
                    <div class="field col-1"></div>
                    <div class="label">Height: </div>
                    <div class="field col"></div>
                    <div class="label">Width: </div>
                    <div class="field col"></div>
                </div>
                <div class="row">
                    <div class="label">Level: </div>
                    <div class="field col-1"></div>
                    <div class="label">Classes: </div>
                    <div class="field col"></div>
                    <div class="label"> / </div>
                    <div class="field col"></div>
                    <div class="label"> / </div>
                    <div class="field col"></div>
                    <div class="label"> / </div>
                    <div class="field col"></div>
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
                        <th> &nbsp;VALUE&nbsp; </th>
                        <th> &nbsp; </th>
                        <th>COMBAT</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr><th>HP</th><td></td><th>MOD</th><th>STAGES</th></tr>
                    <tr><th>ATK</th><td></td><td></td><td></td></tr>
                    <tr><th>DEF</th><td></td><td></td><td></td></tr>
                    <tr><th>&nbsp;SP.ATK&nbsp;</th><td></td><td></td><td></td></tr>
                    <tr><th>SP.DEF</th><td></td><td></td><td></td></tr>
                    <tr><th>SPD</th><td></td><td></td><td></td></tr>
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
                        <th>Perception</th>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <th>Arms</th>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <th colspan="3">EVASION</th>
                    </tr>
                    <tr>
                        <th>Physical</th><td colspan="2"></td>
                    </tr>
                    <tr>
                        <th>Special</th><td colspan="2"></td>
                    </tr>
                    <tr>
                        <th>Speed</th><td colspan="2"></td>
                    </tr>
                </table>
            </div>
        </div>
        <br/>
        <div class="row row-tables" id="skills">
            <div class="col">
                <table class="stats">
                    <tr>
                        <th>Skill</th>
                        <th>Value</th>
                        <th>Notes</th>
                    </tr>
                    <tr><th>Overland</th><td class="value"></td><td></td></tr>
                    <tr><th>Surface</th><td class="value"></td><td></td></tr>
                    <tr><th>Underwater</th><td class="value"></td><td></td></tr>
                    <tr>
                        <th>Skill</th>
                        <th>Total</th>
                        <th>Attr</th>
                    </tr>
                    @each('pages.sheets.includes.skillrow', $trainer->getAllTrainerSkills(), 'skill')
                </table>
            </div>
            <div class="col-5">
                <div class="container">
                    <div class="row">
                        <table class="stats">
                            <tr>
                                <th>Current Pokémon</th>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <th>Companion / Channelled</th>
                            </tr>
                            <tr><td>&nbsp;</td></tr>
                        </table>
                    </div>
                    <br/>
                    <div>
                        <div class="row">
                            <p style="margin-bottom: 0; font-size: 1rem;">
                                <b>Inventory: </b>
                            </p>
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
                </div>
            </div>
        </div>
        <br/>
        <div class="row" id="features"></div>
        <br/>
        <div class="row" id="notes">
            <div class="col container">

            </div>
        </div>
    </div>
</div>
</div>
<div class="page">
<div class="subpage">
    <div id="sheet" class="container">
        <div class="row" style="padding-top: 12px;">
            <table class="stats">
                <thead>
                    <tr>
                        <th style="width: 1px;">L</th>
                        <th colspan="2">Feature</th>
                        <th>Class</th>
                        <th style="width: 1px;">Legal</th>
                        <th style="width: 1px;">Action</th>
                        <th>Freq. </th>
                        <th colspan="3">Effect</th>
                    </tr>
                </thead>
                <tbody>
                    @for($i = 1; $i < 41;$i++)
                        @php
                        $l = $i;
                        @endphp
                        <tr><th style="width: 1px;">{{$l}}</th><td colspan="2"></td><td></td><td></td><td></td><td></td><td></td></tr>
                    @endfor
                </tbody>
            </table>
        </div>
    </div>
</div>
@stop