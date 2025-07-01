# Importing necessary libraries
from datetime import datetime       # Used to track start and end times
import asyncio                      # For asynchronous programming
from asyncio import Future          # Type hint for asyncio task results
import requests                     # For making HTTP requests (sync)
from requests import Response       # Type hint for response object

#--------------------------------------------------
# Async function to check the status of a website
#--------------------------------------------------
async def check_status(url: str) -> dict[str, int | str]:
    # Record the current time (before request starts)
    start_time = datetime.now()

    # Since requests.get() is synchronous (blocking),
    # run it in a separate thread so it doesn't block the event loop
    response = await asyncio.to_thread(requests.get, url, None)

    # Record the time after the request finishes
    end_time = datetime.now()

    # Return a dictionary with results
    return {
        'website': url,                                # URL checked
        'status': response.status_code,                # HTTP response status (e.g., 200, 404)
        'start_time': start_time.strftime('%H:%M:%S'), # Start time (formatted)
        'end_time': end_time.strftime('%H:%M:%S')      # End time (formatted)
    }

#--------------------------------------------------
# Main async function
#--------------------------------------------------
async def main() -> None:
    print('Fetching results:')

    # Create multiple website-check tasks using asyncio.gather
    # We also add return_exceptions=True to catch failures like invalid URLs
    tasks: Future = asyncio.gather(
        check_status('https://www.google.com'),
        check_status('https://www.apple.com'),
        check_status('https://www.bing.com'),
        check_status('https://www.youtube.com'),
        check_status('https:lol'),  # Invalid URL, will raise an exception
        return_exceptions=True
    )

    # Await the completion of all tasks and collect the results
    results: list[dict] = await tasks

    # Print the full raw result list
    print(results)

    # Loop through results and display each one
    for result in results:
        # If a task failed, result will be an Exception instead of a dict
        if isinstance(result, Exception):
            print(f'Error: {result}')
        else:
            print(result)

#--------------------------------------------------
# Run the program only if this file is executed directly
#--------------------------------------------------
if __name__ == '__main__':
    asyncio.run(main())  # Start the async event loop
