from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse
from pydantic import BaseModel
import os

app = FastAPI(title="Oeneye Quantum - Launchpad & Search Dashboard")

class CopyPackageRequest(BaseModel):
    source_name: str = "ibm-bubble-16k"
    version: str = "1.3-2-jammy1"
    from_ppa: str = "sandbox-ppa"
    to_series: str = "noble"

@app.get("/", response_class=HTMLResponse)
def get_dashboard():
    # Serves the index.html created in Step 2
    if os.path.exists("index.html"):
        with open("index.html", "r", encoding="utf-8") as f:
            return f.read()
    return "<h1>index.html not found</h1>"

@app.post("/api/copy-package")
def copy_package(req: CopyPackageRequest):
    try:
        from launchpadlib.launchpad import Launchpad

        lp = Launchpad.login_with("ppa-release-candidate", "production")
        me = lp.me
        ppa = me.getPPAByName(name=req.from_ppa)

        ppa.copyPackage(
            source_name=req.source_name,
            version=req.version,
            from_archive=ppa,
            to_series=req.to_series,
            to_pocket="Release",
            include_binaries=False
        )
        return {
            "success": True, 
            "message": f"Candidate package '{req.source_name}' successfully copied to {req.to_series} series."
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

