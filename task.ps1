param(
    [Parameter(ValueFromRemainingArguments=$true)]
    [string[]]$Args
)

function Show-Usage {
    Write-Host "Usage:"
    Write-Host "  task.ps1                          # Lists all tasks"
    Write-Host "  task.ps1 list                     # Lists all tasks"
    Write-Host "  task.ps1 sync                     # Syncs with Todoist"
    Write-Host "  task.ps1 delete <task_id>         # Deletes a task"
    Write-Host "  task.ps1 project <name>           # Adds a new project"
    Write-Host "  task.ps1 @ MyProject Buy milk     # Adds 'Buy milk' to the 'MyProject' list"
    Write-Host "  task.ps1 Buy bread                # Adds 'Buy bread' to the default 'TODO' list"
}

if ($Args.Count -eq 0 -or $Args[0] -eq "list") {
    todoist list
}
elseif ($Args[0] -eq "sync") {
    todoist s
}
elseif ($Args[0] -eq "delete" -and $Args.Count -ge 2) {
    todoist delete $Args[1]
}
elseif ($Args[0] -eq "project" -and $Args.Count -eq 2) {
    todoist add-project $Args[1]
}
elseif ($Args[0] -eq "@" -and $Args.Count -ge 3) {
    $projectName = $Args[1]
    $taskTitle = $Args[2..($Args.Count-1)] -join " "
    todoist add -N $projectName $taskTitle
}
elseif ($Args.Count -ge 1) {
    $taskTitle = $Args -join " "
    todoist add -N todo $taskTitle
}
else {
    Show-Usage
}
