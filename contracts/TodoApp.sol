// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TodoApp {
    struct Task {
        uint id;
        string task;
        bool completed;
    }

    Task[] public tasks;

    function addNewTask(string memory taskDesc) public  {
        Task memory newTask = Task(tasks.length, taskDesc, false);
        tasks.push(newTask);
    }

    function markAsCompleted(uint taskId) public {
        Task storage taskToChange = tasks[taskId];
        require(taskToChange.completed == false, "Already completed");
        taskToChange.completed = true;
    }

    function deleteTask(uint taskId) public {
        require(taskId < tasks.length, "index out of bound");

        for (uint i = taskId; i < tasks.length - 1; i++) {
            tasks[i] = tasks[i + 1];
            tasks[i].id = i;
        }
        
        tasks.pop();
    }
}