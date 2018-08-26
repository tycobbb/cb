import { Controller } from "stimulus"
import { register } from "../application"

export class ImageField extends Controller {
  static targets = [
    "preview"
  ]

  // actions
  didPickFile(event) {
    this.previewFile(event.target.files[0])
  }

  // file preview
  private fileReader: FileReader | null = null
  private previewTarget!: Element

  private previewFile(file: File) {
    if (this.fileReader == null) {
      this.fileReader = new FileReader()
      this.fileReader.onload = this.didLoadPreview
    }

    this.fileReader.readAsDataURL(file)
  }

  private didLoadPreview = (event: ProgressEvent) => {
    const source = this.getFileSource(event)

    if (source != null) {
      this.previewTarget.setAttribute("src", source)
    } else {
      this.previewTarget.removeAttribute("src")
    }
  }

  private getFileSource(event: ProgressEvent): string | null {
    const target = event.target
    if (target == null || !(target instanceof FileReader)) {
      return null
    }

    const result = target.result
    if (result == null || !(typeof result === "string")) {
      return null
    }

    return result
  }
}

register("image-field", ImageField)
