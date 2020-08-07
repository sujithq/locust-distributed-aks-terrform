#!/usr/bin/env python

# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import random
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    wait_time = between(3, 5)
    @task
    def index_page(self):
        # self.client.get(url="/")
        self.client.get(url="/v1/locations?category=museum,attractionOrAnimalPark&page=1&size=20&latitude=50.89974549082821&longitude=2.872880633359138&distance=10000", headers={"x-app-os": "ios", "x-app-version": "1.0.0", "x-language": "nl"})
        self.client.get(url="/v1/locations?category=museum,attractionOrAnimalPark&page=1&size=20&latitude=50.89974549082821&longitude=2.872880633359138&distance=10000&q=Iep", headers={"x-app-os": "ios", "x-app-version": "1.0.0", "x-language": "nl"})
        self.client.get(url="/v1/static/copy", headers={"x-app-os": "ios", "x-app-version": "1.0.0", "x-language": "nl"})
    