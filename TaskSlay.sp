#pragma semicolon 1
#pragma newdecls required

Handle handle;
public void OnPluginStart() {
    HookEvent("round_end", RoundEnd, EventHookMode_Post);
}

static void RoundEnd(Event event, const char[] name, bool dontBroadcast) {
    int winner = event.GetInt("winner");
    int reason = event.GetInt("reason");

    if ((reason == 15) || (reason == 16) || (winner < 2) || (winner > 3)) {
        return;
    }

    ServerCommand("sm_slay @%s", ((winner == 2) ? "ct" : "t"));
}
