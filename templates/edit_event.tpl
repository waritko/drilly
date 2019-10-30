{extends file='layout.tpl'}
{block name=content}
    <form action="index.php?action=add-drill&amp;edit=T" method="post">
        <table width="100%" border="0">
            <tr>
                <td colspan="2">
                    <label for="date">Datum:</label> <input type="date" name="date" id="date" value="{$date}">
                </td>
                <td colspan="2">
                    <label for="eventOrder">Pořadí cvičení ve dni: </label><input type="number" min="1" max="127" value="{$eventOrder}" name="eventOrder" id="eventOrder">
                </td>
                <td>
                    <input type="checkbox" name="ismatch" id="ismatch" {if $isMatch}checked{/if}> <label for="ismatch">Závod</label>
                    <input type="hidden" name="drillset" value="{$drillSet}">
                    <input type="hidden" name="eventId" value="{$eventId}">
                </td>
                <td colspan="5">&nbsp;</td>
            </tr>
	    <tr>
		<td>Memo:</td>
		<td colspan="3"><input type="text" name="memo" id="memo" size="50" value="{$memo}"></td>
		<td colspan="3"><input type="text" name="userSet" id="userSet" size="30" value="{$userSet}"></td>
	    </tr>
            <tr>
                <th>Cvičení</th>
                <th>Čas</th>
                <th>H (+0)</th>
                <th>A (+0)</th>
                <th>C (+1)</th>
                <th>D (+2)</th>
                <th>M (+5)</th>
                <th>Proc (+3)</th>
            </tr>{assign var=i value=0}
            {foreach $drills as $drill}{assign var=i value=$i+1}<tr>
                <td>{$drill.name}</td>
                <td><input type="number" min="0" step="0.01" max="1000" name="drill{$i}time" id="drill{$i}time" value="{$drill.baseTime}"></td>
                <td>
                    {if $drill.maxhead > 0}
                        <input type="number" max="{$drill.maxhead}" min="0" step="1" value="{$drill.head}" name="drill{$i}head" id="drill{$i}head" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}head" id="drill{$i}head"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td>
                    {if $drill.maxalpha > 0}
                        <input type="number" max="{$drill.maxalpha}" min="0" step="1" value="{$drill.alpha}" name="drill{$i}alpha" id="drill{$i}alpha" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}alpha" id="drill{$i}alpha"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td>
                    {if $drill.maxcharlie > 0}
                        <input type="number" max="{$drill.maxcharlie}" min="0" step="1" value="{$drill.charlie}" name="drill{$i}charlie" id="drill{$i}charlie" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}charlie" id="drill{$i}charlie"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td>
                    {if $drill.maxdelta > 0}
                        <input type="number" max="{$drill.maxdelta}" min="0" step="1" value="{$drill.delta}" name="drill{$i}delta" id="drill{$i}delta" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}delta" id="drill{$i}delta"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td><input type="number" max="{$drill.maxalpha+$drill.maxhead}" min="0" step="1" value="{$drill.miss}" name="drill{$i}miss" id="drill{$i}miss"></td>
                <td>
                    <input type="number" max="{$drill.alpha+$drill.head}" min="0" step="1" value="{$drill.proc}" name="drill{$i}proc" id="drill{$i}proc">
                    <input type="hidden" value="{$drill.id}" name="drill{$i}type">
                    <input type="hidden" value="{$drill.situationId}" name="drill{$i}situation">
                </td>
            </tr>
            {/foreach}
            <tr>
                <td colspan="2"><input type="submit" value="Odeslat" class="btn-lg btn-info" style="margin-top: 12px;"></td>
            </tr>
        </table>
    </form>
{/block}
{block name=foot}
    <script type="text/javascript" src="./js/updateMiss.js"></script>
{/block}
