/**
 * Display results in the console in two formats:
 *   1. Raw object (expandable in DevTools)
 *   2. Pretty-printed JSON (stringified, if valid JSON)
 *   3. Plain string (logged directly if not JSON)
 *
 * @param {string} fname - Label (usually the function name).
 * @param {object|string} result - The fetch result. Can be a parsed object
 *                                 or a raw JSON string.
 *
 * @example
 * With an object:
 * consoleDisplay("fetchByZip", { city: "New York", state: "NY" });
 *
 * @example
 * With a JSON string:
 * consoleDisplay("fetchByZip", '{"city":"New York","state":"NY"}');
 *
 * @example
 * With a plain string:
 * consoleDisplay("fetchByZip", "Service unavailable");
 */
function consoleDisplay(fname, result) {
	const resultDisplay = true;
	const stringifyDisplay = true;

	if (resultDisplay) {
		console.log("01: result from %s: %o", fname, result);
	}

	if (!stringifyDisplay) return;

	try {
		let parsed = result;

		if (typeof result === "string") {
			try {
				parsed = JSON.parse(result); // try parsing JSON string
			} catch {
				// not JSON, just log raw string
				console.log(`02: result from ${fname} (plain string): "${result}"`);
				return;
			}
		}

		if (typeof parsed === "object" && parsed !== null) {
			// console.log(`02: result from ${fname} (pretty JSON):\n${JSON.stringify(parsed, null, 2)}`);
		} else {
			console.log(`02: result from ${fname} (value):`, parsed);
		}
	} catch (e) {
		console.log(`02: not valid JSON/object:`, e.message);
	}
}
