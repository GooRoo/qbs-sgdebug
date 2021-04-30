/*
 * MIT License
 *
 * Copyright (c) 2021 Serhii 'GooRoo' Olendarenko
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
*/

import qbs
import qbs.Environment
import qbs.ModUtils

Module {
	property string visualize
	PropertyOptions {
		name: 'visualize'
		description: 'Visualize various aspects of the scene graph\'s default renderer'
		allowedValues: [
			'batches',
			'clip',
			'changes',
			'overdraw',
			''
		]
	}

	property bool logInfo: false
	PropertyOptions {
		name: 'logInfo'
		description: 'printing system information when initializing the Qt Quick scene graph. ' +
		             'This can be very useful for troubleshooting.'
	}

	property bool logStats: false
	PropertyOptions {
		name: 'logStats'
		description: 'output statistics on how well the batching goes, how many batches are used, ' +
		             'which batches are retained and which are opaque and not'
	}

	property bool logTiming: false
	PropertyOptions {
		name: 'logTiming'
		description: 'Output a number of useful timing parameters which can be useful in pinpointing ' +
		             'where a rendering problem lies'
	}

	property bool colorizeAtlasTextures: false
	PropertyOptions {
		name: 'colorizeAtlasTextures'
		description: 'Colorize atlas textures to easily identify them in the application'
	}

	setupRunEnvironment: {
		function enableFeature (prop, envVar, value) {
			var propVal = ModUtils.moduleProperty(product, prop)
			var envVarVal = value || propVal

			if (propVal) {
				console.info('  - ' + envVar + '=' + envVarVal)
				Environment.putEnv(envVar, envVarVal)
			}
		}

		console.info('Running with the environment:')

		enableFeature('logStats', 'QSG_RENDERER_DEBUG', 'render')
		enableFeature('logInfo', 'QSG_INFO', 1)
		enableFeature('colorizeAtlasTextures', 'QSG_ATLAS_OVERLAY', 1)
		enableFeature('logTiming', 'QSG_RENDER_TIMING', 1)
		enableFeature('visualize', 'QSG_VISUALIZE') }
}
