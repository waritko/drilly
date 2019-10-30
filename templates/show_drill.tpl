{extends file='layout.tpl'}
{block name=content}
    <h3>Drill {$date}</h3>
    <p>{$memo}</p>
    <table width="100%" border="1">
        <tr>
            <th style="padding-left: 0.5em;">Cvičení</th>
            <th style="padding-left: 0.5em;">Čas</th>
            <th style="padding-left: 0.5em;">H (+0)</th>
            <th style="padding-left: 0.5em;">A (+0)</th>
            <th style="padding-left: 0.5em;">C (+1)</th>
            <th style="padding-left: 0.5em;">D (+2)</th>
            <th style="padding-left: 0.5em;">M (+5)</th>
            <th style="padding-left: 0.5em;">Proc (+3)</th>
            <th style="padding-left: 0.5em;">Výsledný čas</th>
        </tr>
        {foreach $drills as $drill}
            <tr>
                <td style="padding-left: 0.5em;"><a href="index.php?action=drill-detail&amp;drill={$drill.id}">{$drill.name}</a></td>
                <td style="padding-left: 0.5em;">{$drill.baseTime}</td>
                <td style="padding-left: 0.5em;">{$drill.head}</td>
                <td style="padding-left: 0.5em;">{$drill.alpha}</td>
                <td style="padding-left: 0.5em;">{$drill.charlie}</td>
                <td style="padding-left: 0.5em;">{$drill.delta}</td>
                <td style="padding-left: 0.5em;">{$drill.miss}</td>
                <td style="padding-left: 0.5em;">{$drill.proc}</td>
                <td style="padding-left: 0.5em;"><b>{$drill.time}</b></td>
            </tr>
        {/foreach}
        <tr>
            <td colspan="9">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="6">&nbsp;</td>
            <td style="padding-left: 0.5em;">Čistý čas</td>
            <td style="padding-left: 0.5em;">Penalizace</td>
            <td style="padding-left: 0.5em;"><b>Výsledný čas</b></td>
        </tr>
        <tr>
            <td colspan="6">Výsledný čas</td>
            <td style="background: darkseagreen; padding-left: 0.5em;">{$baseTime} s</td>
            <td style="background: darkseagreen; padding-left: 0.5em;">{$penaltyTime} s</td>
            <td style="background: darkseagreen; padding-left: 0.5em;"><b>{$totalTime} s</b></td>
        </tr>
    </table>
    <div style="font-size: 120%; margin-top: 0.75em;">
        {if $allowEdit}<a href="./index.php?action=edit-event&amp;drill={$eventId}" class="btn btn-warning">Editovat</a>{/if}
        <a href="./index.php?{$queryString}&amp;userId={$userId}" class="btn btn-info">Odkaz pro sdílení</a>
	{if $userSet}<a href="./index.php?action=display-user-set&amp;userSet={$userSet|escape:'html'}&amp;drillSet={$drillSet}" target="_blank" class="btn btn-info">{$userSet}</a>{/if}
        {if $allowEdit}<a href="./index.php?action=delete-event&amp;event={$eventId}" class="btn btn-danger btn-xs pull-right" onclick="return confirm('Opravdu chcete záznam smazat? Tato akce je nevratná!')">Smazat</a>{/if}
    </div>
{/block}
