import { h, render } from 'preact'
import { App } from '../app'

const root = document.getElementById('root')
root && render(<App />, root)
