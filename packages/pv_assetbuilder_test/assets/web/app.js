/**
 * PV Asset Builder Test Application
 * Demonstrates custom JavaScript loading with validation
 */

'use strict';

// Application configuration
const AppConfig = {
    name: 'PV Asset Builder Test',
    version: '1.0.0',
    debug: true
};

// Feature modules
const AssetDemo = {
    // Initialize the demo
    init() {
        console.log(`🚀 ${AppConfig.name} v${AppConfig.version} initialized`);
        this.setupEventListeners();
        this.showAssetInfo();
    },
    
    // Set up interactive elements
    setupEventListeners() {
        // Smooth scrolling for navigation
        document.querySelectorAll('nav a[href^="#"]').forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const target = document.querySelector(link.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth' });
                }
            });
        });
        
        // Add hover effects to features
        document.querySelectorAll('.feature').forEach(feature => {
            feature.addEventListener('mouseenter', () => {
                feature.style.transform = 'translateY(-5px)';
                feature.style.transition = 'transform 0.3s ease';
            });
            
            feature.addEventListener('mouseleave', () => {
                feature.style.transform = 'translateY(0)';
            });
        });
    },
    
    // Display asset loading information
    showAssetInfo() {
        const info = {
            htmlLoaded: true,
            cssLoaded: true,
            jsLoaded: true,
            timestamp: new Date().toISOString(),
            customLoader: 'web_loaders:loadWebContent'
        };
        
        if (AppConfig.debug) {
            console.log('📄 Asset Loading Info:', info);
        }
        
        // Add a status indicator
        this.createStatusIndicator(info);
    },
    
    // Create visual status indicator
    createStatusIndicator(info) {
        const indicator = document.createElement('div');
        indicator.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #2ecc71;
            color: white;
            padding: 10px 15px;
            border-radius: 20px;
            font-size: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            z-index: 1000;
        `;
        indicator.textContent = '✅ Custom loaders active';
        document.body.appendChild(indicator);
        
        // Auto-hide after 3 seconds
        setTimeout(() => {
            indicator.style.opacity = '0';
            indicator.style.transition = 'opacity 0.5s ease';
            setTimeout(() => indicator.remove(), 500);
        }, 3000);
    }
};

// Utility functions
const Utils = {
    // Format file sizes
    formatBytes(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    },
    
    // Generate random colors
    randomColor() {
        return `hsl(${Math.floor(Math.random() * 360)}, 70%, 60%)`;
    },
    
    // Debounce function
    debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }
};

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => AssetDemo.init());
} else {
    AssetDemo.init();
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { AssetDemo, Utils, AppConfig };
} 