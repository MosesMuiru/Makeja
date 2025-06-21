defmodule MakejaWeb.Components.UploadComponent do
  use Phoenix.LiveComponent

  def upload_component(assigns) do
    ~H"""
    <div class="max-w-md mx-auto">
      <!-- Upload Area -->
      <div class="border-2 border-dashed border-upload-border rounded-lg p-8 text-center bg-upload-bg hover:bg-gray-50 transition-colors duration-200">
        <!-- Upload Icon -->
        <div class="mb-4">
          <svg
            class="mx-auto h-12 w-12 text-gray-400"
            stroke="currentColor"
            fill="none"
            viewBox="0 0 48 48"
          >
            <path
              d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>
        </div>
        
    <!-- Upload Text -->
        <div class="text-gray-600 mb-2">
          <span class="font-medium">Drag & drop file(s) to upload</span>
        </div>
        
    <!-- Browse Link -->
        <div class="text-sm">
          <span class="text-gray-500">or </span>
          <button class="text-blue-600 hover:text-blue-700 underline font-medium">
            browse
          </button>
        </div>
      </div>
      
    <!-- File List -->
      <div class="mt-4 space-y-2">
        <!-- File Item 1 -->
        <div class="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200 shadow-sm">
          <div class="flex items-center space-x-3">
            <!-- File Icon -->
            <div class="flex-shrink-0">
              <svg class="h-8 w-8 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                <path
                  fill-rule="evenodd"
                  d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z"
                  clip-rule="evenodd"
                />
              </svg>
            </div>
            
    <!-- File Info -->
            <div class="flex-1 min-w-0">
              <p class="text-sm font-medium text-gray-900 truncate">
                Resume 2024.pdf
              </p>
            </div>
          </div>

          <div class="flex items-center space-x-2">
            <!-- Success Icon -->
            <div class="flex-shrink-0">
              <div class="w-5 h-5 bg-green-500 rounded-full flex items-center justify-center">
                <svg class="w-3 h-3 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M5 13l4 4L19 7"
                  >
                  </path>
                </svg>
              </div>
            </div>
            
    <!-- Delete Button -->
            <button class="flex-shrink-0 p-1 text-gray-400 hover:text-gray-600 transition-colors">
              <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                >
                </path>
              </svg>
            </button>
          </div>
        </div>
        
    <!-- File Item 2 -->
        <div class="flex items-center justify-between p-3 bg-white rounded-lg border border-gray-200 shadow-sm">
          <div class="flex items-center space-x-3">
            <!-- File Icon -->
            <div class="flex-shrink-0">
              <svg class="h-8 w-8 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                <path
                  fill-rule="evenodd"
                  d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z"
                  clip-rule="evenodd"
                />
              </svg>
            </div>
            
    <!-- File Info -->
            <div class="flex-1 min-w-0">
              <p class="text-sm font-medium text-gray-900 truncate">
                Cover Letter.pdf
              </p>
              <p class="text-xs text-gray-500">
                0.5 MB / 4 MB
              </p>
            </div>
          </div>

          <div class="flex items-center space-x-2">
            <!-- Delete Button -->
            <button class="flex-shrink-0 p-1 text-gray-400 hover:text-gray-600 transition-colors">
              <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"
                >
                </path>
              </svg>
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
