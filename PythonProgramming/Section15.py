#-----------------------------------------------------------------
# ASYNCIO GETTING STARTED EXAMPLE

import asyncio  # Built-in module for asynchronous programming
from datetime import datetime  # Used to capture timestamps

# -----------------------------
# Async function to simulate data fetching
# -----------------------------
async def fetch_data(input_data: str) -> dict:
    print('Fetching data...')  # Indicate that fetching has started

    start_time = datetime.now()  # Capture the current time before delay

    await asyncio.sleep(3)  # Simulate a network delay or slow I/O (non-blocking), it tells our scripts to wait for this line of code to complete before moving on

    end_time = datetime.now()  # Capture the time after delay completes

    print('Data retrieved.')  # Indicate completion of data fetching

    # Return data in dictionary format
    return {
        'input': input_data,
        'start_time': start_time.strftime('%H:%M:%S'),  # Format time for readability
        'end_time': end_time.strftime('%H:%M:%S')
    }

# -----------------------------
# Main async function to manage tasks
# -----------------------------
async def main():
    # Create two asynchronous tasks that run concurrently
    task1 = asyncio.create_task(fetch_data('1'))
    task2 = asyncio.create_task(fetch_data('2'))

    # Await both tasks to finish (this pauses until both complete)
    data1 = await task1
    data2 = await task2

    # Print the results of each completed task
    print(f'Data 1: {data1}')  # Example: {'input': '1', 'start_time': '01:39:02', 'end_time': '01:39:05'}
    print(f'Data 2: {data2}')  # Example: {'input': '2', 'start_time': '01:39:02', 'end_time': '01:39:05'}

# -----------------------------
# Entrypoint: Run the async main function
# -----------------------------
if __name__ == '__main__':
    asyncio.run(main())  # Runs the main() coroutine (are functions that can be suspended and resumed in the future) in the event loop

#-----------------------------------------------------------------
# TASKS WITH ASYNCIO & CANCELLATION DEMO
#Tasks in async IO is a scheduled and independently managed coroutine

import asyncio  # Provides asynchronous I/O support
from asyncio import Task  # Optional: for typing tasks
from datetime import datetime  # For timestamping when data fetching starts/ends

#--------------------------------------------------------
# Async function to simulate data fetching from a remote source
#--------------------------------------------------------
async def fetch_data(input_data: str, delay: int) -> dict:
    print(f'Fetching data for {input_data}...')  # Inform user fetching started

    start_time = datetime.now()  # Record when the task started

    await asyncio.sleep(delay)  # Simulate slow I/O delay (non-blocking sleep)

    end_time = datetime.now()  # Record when the task finished

    print(f'Data retrieved for {input_data}.')  # Inform user fetching finished

    # Return a dictionary with timing and data info
    return {
        'input': input_data,
        'start_time': start_time.strftime('%H:%M:%S'),
        'end_time': end_time.strftime('%H:%M:%S')
    }

#--------------------------------------------------------
# Main async function that runs the tasks
#--------------------------------------------------------
async def main():
    try:
        # Start two concurrent tasks using create_task
        task1: Task = asyncio.create_task(fetch_data('1', 3))  # Completes in 3 seconds
        task2: Task = asyncio.create_task(fetch_data('2', 10))  # Would take 10 seconds

        await asyncio.sleep(1)  # Give tasks some time to run

        print('Running other code...')  # Simulate background work while tasks run

        # Cancel task2 since it takes too long
        task2.cancel(msg='Took too long...')

        try:
            # Await both tasks; task2 will raise an exception since it's canceled
            data1 = await task1
            data2 = await task2  # This line will raise asyncio.CancelledError
        except asyncio.CancelledError:
            # Handle the cancellation of task2 gracefully
            print('Task 2 was cancelled.')

        # Show results of task1 only (task2 was cancelled and not available)
        print(f'Data 1: {data1}')

    except Exception as e:
        # General error handler if something else goes wrong
        print(f'An error occurred: {e}')

#--------------------------------------------------------
# Entry point: Launch the async main function using asyncio
#--------------------------------------------------------
if __name__ == '__main__':
    asyncio.run(main())  # Start the event loop and run the async main

#----------------------------
# GATHER: Run tasks in parallel and handle their results
#----------------------------

import asyncio
from datetime import datetime

#---------------------------------------
# Asynchronous function simulating API/data fetching
#---------------------------------------
async def fetch_data(input_data: str, delay: int, fail: bool = False) -> dict:
    print(f'Fetching data for {input_data}...')  # Inform task is starting

    # Record the start time
    start_time = datetime.now()

    # Optional simulated failure
    if fail:
        # Simulate a task failure before any delay
        raise Exception(f'Task {input_data} failed.')

    # Simulate slow network/API request
    await asyncio.sleep(delay)

    # Record the end time
    end_time = datetime.now()

    # Task completed
    print(f'Data retrieved for {input_data}.')

    # Return dictionary with timing and input info
    return {
        'input': input_data,
        'start_time': start_time.strftime('%H:%M:%S'),
        'end_time': end_time.strftime('%H:%M:%S')
    }

#---------------------------------------
# Main asynchronous entry function
#---------------------------------------
async def main() -> None:
    try:
        # Run multiple async tasks in parallel using gather()
        # If one fails, others keep running (return_exceptions=True)
        tasks = await asyncio.gather(
            fetch_data('1', 2),
            fetch_data('2', 4),
            fetch_data('3', 3, fail=True),  # This one will raise an error
            fetch_data('4', 1),
            return_exceptions=True  # Ensures gather returns all results even if some fail
        )

        print('\nResults:')  # Output section
        for result in tasks:
            if isinstance(result, Exception):
                # If a task failed, its result will be an Exception object
                print(f'Error: {result}')
            else:
                # Successful task result is a dictionary
                print(result)

    except Exception as e:
        # Catches unexpected errors outside gather
        print(f'An unexpected error occurred in main: {e}')

#---------------------------------------
# Launch the async program
#---------------------------------------
if __name__ == '__main__':
    asyncio.run(main())  # Start the event loop
