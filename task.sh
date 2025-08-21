# A versatile shell function to interact with Todoist.
#
# - If called with no arguments, it lists all tasks.
# - If the first argument is "list", it lists all tasks.
# - If the first argument is "sync", it syncs with Todoist.
# - If the first argument is "delete", it deletes the specified task ID.
# - If the first argument is "project", it adds a new project with the given name.
# - If the first argument is "@", the next argument is the project name,
#   and the remaining arguments form the task string.
# - Otherwise, it assumes all arguments are for a new task in the
#   default 'TODO' project.
#
# Usage:
#   task                          # Lists all tasks
#   task list                     # Lists all tasks
#   task sync                     # Syncs with Todoist
#   task delete <task_id>         # Deletes a task
#   task project <name>           # Adds a new project
#   task @ MyProject Buy milk     # Adds "Buy milk" to the "MyProject" list
#   task Buy bread                # Adds "Buy bread" to the default "TODO' list
task() {
    # Handles `task` and `task list`
    if [ "$#" -eq 0 ] || [ "$1" = "list" ]; then
        todoist list
    # Handles `task sync`
    elif [ "$1" = "sync" ]; then
        todoist s
    # Handles `task delete <task_id>`
    elif [ "$1" = "delete" ]; then
        shift
        todoist delete "$*"
    # Handles `task project <name>`
    elif [ "$1" = "project" ] && [ "$#" -eq 2 ]; then
        todoist add-project "$2"
    # Handles `task @ <PROJECT> <task string>`
    elif [ "$1" = "@" ] && [ "$#" -gt 2 ]; then
        # Remove the "@"
        shift
        project_name="$1"
        # Remove the project name
        shift
        todoist add -N "$project_name" "$*"
    # All other inputs are treated as a task for the default 'TODO' project
    else
        todoist add -N todo "$*"
    fi
}
