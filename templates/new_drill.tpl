{extends file='layout.tpl'}
{block name=content}
    <form action="index.php?action=add-drill" method="post">
        <table width="100%" border="0">
            <tr>
                <td colspan="2">
                    <label for="date">Datum:</label> <input type="date" name="date" id="date">
                </td>
                <td colspan="2">
                    <label for="eventOrder">Pořadí cvičení ve dni: </label><input type="number" min="1" max="127" value="1" name="eventOrder" id="eventOrder">
                </td>
                <td>
                    <input type="checkbox" name="ismatch" id="ismatch"> <label for="ismatch">Závod</label>
                    <input type="hidden" name="drillset" value="{$drillSet}">
                </td>
                <td colspan="5">&nbsp;</td>
            </tr>
	    <tr>
		<td>Memo:</td>
		<td colspan="3"><input type="text" name="memo" id="memo" size="50"></td>
		<td>User Set</td>
		<td colspan="3"><input type="text" name="userSet" id="userSet" size="30"></td>
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
                <td><input type="number" min="0" step="0.01" max="1000" name="drill{$i}time" id="drill{$i}time"></td>
                <td>
                    {if $drill.head > 0}
                        <input type="number" max="{$drill.head}" min="0" step="1" value="{$drill.head}" name="drill{$i}head" id="drill{$i}head" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}head" id="drill{$i}head"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td>
                    {if $drill.alpha > 0}
                        <input type="number" max="{$drill.alpha}" min="0" step="1" value="{$drill.alpha}" name="drill{$i}alpha" id="drill{$i}alpha" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}alpha" id="drill{$i}alpha"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td>
                    {if $drill.charlie > 0}
                        <input type="number" max="{$drill.charlie}" min="0" step="1" value="0" name="drill{$i}charlie" id="drill{$i}charlie" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}charlie" id="drill{$i}charlie"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td>
                    {if $drill.delta > 0}
                        <input type="number" max="{$drill.delta}" min="0" step="1" value="0" name="drill{$i}delta" id="drill{$i}delta" onchange="updateMiss('drill{$i}')">
                    {else}
                        <input type="hidden" value="0" name="drill{$i}delta" id="drill{$i}delta"><span style="text-align: center; font-weight: bold;">0</span>
                    {/if}
                </td>
                <td><input type="number" max="{$drill.alpha+$drill.head}" min="0" step="1" value="0" name="drill{$i}miss" id="drill{$i}miss"></td>
                <td>
                    <input type="number" max="{$drill.alpha+$drill.head}" min="0" step="1" value="0" name="drill{$i}proc" id="drill{$i}proc">
                    <input type="hidden" value="{$drill.id}" name="drill{$i}type">
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
