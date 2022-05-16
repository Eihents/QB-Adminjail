local Translations = {
    error = {
        ["missing_something"] = "Izskatās kad kaut kas pietrūkst...",
        ["not_enough_police"] = "Nav pietiekami daudz policisti pilsētā..",
        ["door_open"] = "Šīs durvis ir jau atvērtas..",
        ["cancelled"] = "Process Atcelts..",
        ["didnt_work"] = "Diemžēl šis nestrādāja..",
        ["emty_box"] = "Kaste bija tukša..",
        ["injail"] = "Tu es cietuma uz %{Time} menesiem..",
        ["item_missing"] = "Tev pietrūkst kāda lieta..",
        ["escaped"] = "Tu izbēgi no cietuma... Pazūdi no turienis cik ātri vari sha policija brauc!",
        ["do_some_work"] = "Izdari kādus darbiņus lai laiks atrāk paiet: %{currentjob} ",
    },
    success = {
        ["found_phone"] = "Tu atradi Telefonu..",
        ["time_cut"] = "Tu nostrādāji mēnēšus nost no sava cietumsoda.",
        ["free_"] = "Tu tiki no cietuma arā! Izbaudi to kamēr vari! :)",
        ["timesup"] = "Tavs Laiks ir beidzies, no apmaklētajiem jāatvadas un jadodas atpakaļ uz savu kameru cietumā .",
    },
    info = {
        ["timeleft"] = "Tev vel palika... %{JAILTIME} menesi",
        ["lost_job"] = "Tu esi Bezdarbinieks",
        ["jail_time"] = 'Laiks cik viņiem jāatrodas cietumā',
        ["jail_time_no"] = 'Cietuma laikam ir jābūt lielākam par 0',
        ["sent_jail_for"] = 'Jūs nosūtījāt personu adminjailā uz %{time} minūtēm',
        ["jail_time_input"] = 'Adminjail laiks',

    },
    commands = {

        ["jail_player"] = 'Ievietot cietuma (tikai policija)',
        ["unjail_player"] = 'Iznemt no cietuma (tikai policija)',
    },
}
Lang = Locale:new({
phrases = Translations,
warnOnMissing = true})
